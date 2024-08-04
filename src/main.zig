const limine = @import("limine");
const std = @import("std");
const Serial = @import("x86/Serial.zig");
const Terminal = @import("Terminal.zig");
const idt = @import("x86/idt.zig");
const apic = @import("x86/apic.zig");
const pmm = @import("pmm.zig");
const paging = @import("paging.zig");
const vmm = @import("vmm.zig");

pub export var base_revision = limine.BaseRevision{ .revision = 2 };
pub export var hhdm_request = limine.HhdmRequest{};
pub export var memory_map_request = limine.MemoryMapRequest{};
pub export var kernel_address_request = limine.KernelAddressRequest{};

inline fn halt() noreturn {
    while (true) asm volatile ("hlt");
}

var terminal: Terminal = undefined;

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

    const hhdm_offset = hhdm_request.response.?.offset;
    const memory_map_entries = memory_map_request.response.?.entries();
    const kernel_address_response = kernel_address_request.response.?;

    var serial = Serial.init(Serial.COM1, 9600);

    terminal = serial.terminal();
    terminal.writeString("Terminal: Initialized\n");

    idt.init();
    terminal.writeString("IDT: Initialized\n");

    apic.init(hhdm_offset);
    terminal.writeString("APIC: Initialized\n");

    asm volatile ("sti");

    pmm.init(hhdm_offset, memory_map_entries);
    terminal.writeString("PMM: Initialized\n");

    paging.init(hhdm_offset, kernel_address_response.physical_base, kernel_address_response.virtual_base) catch std.debug.panic("Paging: Out of memory", .{});
    terminal.writeString("Paging: Initialized\n");

    vmm.init(hhdm_offset);
    terminal.writeString("VMM: Initialized\n");

    halt();
}
