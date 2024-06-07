const limine = @import("limine");
const std = @import("std");
const serial = @import("serial.zig");
const idt = @import("idt.zig");
const apic = @import("apic.zig");
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

pub fn panic(msg: []const u8, error_return_trace: ?*std.builtin.StackTrace, siz: ?usize) noreturn {
    _ = error_return_trace;
    _ = siz;

    @setCold(true);

    serial.writeString(serial.COM1, "Panic: ");
    serial.writeString(serial.COM1, msg);

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

    serial.init(serial.COM1, 9600);
    serial.writeString(serial.COM1, "Serial: Initialized\n");

    idt.init();
    serial.writeString(serial.COM1, "IDT: Initialized\n");

    apic.init(hhdm_offset);
    serial.writeString(serial.COM1, "APIC: Initialized\n");

    asm volatile ("sti");

    pmm.init(hhdm_offset, memory_map_entries);
    serial.writeString(serial.COM1, "PMM: Initialized\n");

    paging.init(hhdm_offset, kernel_address_response.physical_base, kernel_address_response.virtual_base) catch std.debug.panic("Paging: Out of memory", .{});
    serial.writeString(serial.COM1, "Paging: Initialized\n");

    vmm.init(hhdm_offset);
    serial.writeString(serial.COM1, "VMM: Initialized\n");

    halt();
}
