const port = @import("port.zig");

const BaseRegister = packed struct {
    reserved_1: u8,
    is_bsp: u1,
    reserved_2: u2,
    global_enable: u1,
    base_address: u20,
    reserved_3: u32,
};

const SpuriousInterruptVectorRegister = packed struct {
    spurious_vector: u8,
    apic_software_enable: u1,
    focus_processor_checking: u1,
    reserved: u22,
};

const LAPIC_BASE_ADDRESS: u64 = 0xFEE00000;

const ID_REGISTER: u32 = 0x20;
const SIV_REGISTER: u32 = 0xF0;
const EOI_REGISTER: u32 = 0xB0;
const ICR_HIGH_REGISTER: u32 = 0x310;
const ICR_LOW_REGISTER: u32 = 0x300;

var id_register: *volatile u32 = undefined;
var siv_register: *volatile u32 = undefined;
var eoi_register: *volatile u32 = undefined;
var icr_high_register: *volatile u32 = undefined;
var icr_low_register: *volatile u32 = undefined;

pub fn init(hhdm_offset: u64) void {
    const address = hhdm_offset + LAPIC_BASE_ADDRESS;
    id_register = @ptrFromInt(address + ID_REGISTER);
    siv_register = @ptrFromInt(address + SIV_REGISTER);
    eoi_register = @ptrFromInt(address + EOI_REGISTER);
    icr_high_register = @ptrFromInt(address + ICR_HIGH_REGISTER);
    icr_low_register = @ptrFromInt(address + ICR_LOW_REGISTER);

    var siv: SpuriousInterruptVectorRegister = @bitCast(siv_register.*);
    siv.spurious_vector = 0xFF;
    siv.apic_software_enable = 1;
    siv.focus_processor_checking = 0;
    siv_register.* = @bitCast(siv);
}

pub fn getLocalApicId() u32 {
    return id_register.* >> 24;
}

pub fn sendEoi() void {
    eoi_register.* = 0x00;
}

pub fn sendIpi(dest_local_apic_id: u32, interrupt_vector: u8) void {
    icr_high_register.* = dest_local_apic_id << 24;
    icr_low_register.* = interrupt_vector;
}
