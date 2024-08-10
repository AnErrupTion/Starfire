const limine = @import("limine");
const std = @import("std");
const Serial = @import("x86/Serial.zig");
const Terminal = @import("Terminal.zig");
const idt = @import("x86/idt.zig");
const apic = @import("x86/apic.zig");
const pmm = @import("pmm.zig");
const paging = @import("paging.zig");
const vmm = @import("vmm.zig");
const Heap = @import("Heap.zig");

pub export var base_revision = limine.BaseRevision{ .revision = 2 };
pub export var hhdm_request = limine.HhdmRequest{};
pub export var memory_map_request = limine.MemoryMapRequest{};
pub export var kernel_address_request = limine.KernelAddressRequest{};
pub export var smp_request = limine.SmpRequest{};

inline fn halt() noreturn {
    while (true) asm volatile ("hlt");
}

pub var terminal: Terminal = undefined;
var heap: Heap = undefined;
var hhdm_offset: u64 = undefined;

pub fn panic(msg: []const u8, error_return_trace: ?*std.builtin.StackTrace, siz: ?usize) noreturn {
    _ = error_return_trace;
    _ = siz;

    @setCold(true);

    terminal.writeString("Panic: ");
    terminal.writeString(msg);

    halt();
}

export fn _start() callconv(.C) noreturn {
    if (!base_revision.is_supported()) std.debug.panic("Limine: Base revision not supported!", .{});
    if (hhdm_request.response == null) std.debug.panic("Limine: HHDM not found!", .{});
    if (memory_map_request.response == null) std.debug.panic("Limine: Memory map not found!", .{});
    if (kernel_address_request.response == null) std.debug.panic("Limine: Kernel address not found!", .{});
    if (smp_request.response == null) std.debug.panic("Limine: SMP not supported!", .{});

    hhdm_offset = hhdm_request.response.?.offset;
    const memory_map_entries = memory_map_request.response.?.entries();
    const kernel_address_response = kernel_address_request.response.?;
    const smp_response = smp_request.response.?;

    var serial = Serial.init(Serial.COM1, 9600);

    terminal = serial.terminal();
    terminal.writeString("Terminal: Initialized\n");

    idt.init();
    terminal.writeString("IDT: Initialized\n");

    pmm.init(hhdm_offset, memory_map_entries);
    terminal.writeString("PMM: Initialized\n");

    paging.init(hhdm_offset, kernel_address_response.physical_base, kernel_address_response.virtual_base) catch std.debug.panic("Paging: Out of memory", .{});
    terminal.writeString("Paging: Initialized\n");

    vmm.init(hhdm_offset);
    terminal.writeString("VMM: Initialized\n");

    heap = Heap.init(8192) catch std.debug.panic("Heap: Out of memory", .{});
    terminal.writeString("Heap: Initialized\n");

    apic.init(hhdm_offset);
    terminal.writeString("APIC: Initialized\n");

    asm volatile ("sti");

    for (smp_response.cpus()) |cpu| {
        if (cpu.lapic_id == smp_response.bsp_lapic_id) continue;
        cpu.goto_address = &bootstrapCore;
    }

    halt();
}

fn bootstrapCore(_: *limine.SmpInfo) callconv(.C) noreturn {
    idt.bootstrapCore();
    terminal.writeString("IDT: Bootstrapped\n");

    paging.bootstrapCore();
    terminal.writeString("Paging: Bootstrapped\n");

    apic.init(hhdm_offset);
    terminal.writeString("APIC: Bootstrapped\n");

    asm volatile ("sti");

    while (true) {}
}
