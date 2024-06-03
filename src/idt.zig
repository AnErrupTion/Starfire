const std = @import("std");
const apic = @import("apic.zig");

const IdtRegister = packed struct {
    size: u16,
    offset: u64,
};

const SegmentSelector = packed struct {
    rpl: u2,
    ti: u1,
    index: u13,
};

const TypeAttributes = packed struct {
    gate_type: u4,
    zero: u1,
    dpl: u2,
    p: u1,
};

const GateDescriptor = packed struct {
    offset_low: u16,
    selector: SegmentSelector,
    ist: u8,
    type_attributes: TypeAttributes,
    offset_middle: u16,
    offset_high: u32,
    zero: u32,
};

const Offset = packed struct {
    low: u16,
    middle: u16,
    high: u32,
};

const InterruptStackFrame = packed struct {
    r15: u64,
    r14: u64,
    r13: u64,
    r12: u64,
    r11: u64,
    r10: u64,
    r9: u64,
    r8: u64,
    rdi: u64,
    rsi: u64,
    rbp: u64,
    rbx: u64,
    rdx: u64,
    rcx: u64,
    rax: u64,
    irq: u64,
    error_code: u64,
};

pub fn init() void {
    const idt = [256]GateDescriptor{
        createInterruptHandlerEntry(@intFromPtr(&irq0)),
        createInterruptHandlerEntry(@intFromPtr(&irq1)),
        createInterruptHandlerEntry(@intFromPtr(&irq2)),
        createInterruptHandlerEntry(@intFromPtr(&irq3)),
        createInterruptHandlerEntry(@intFromPtr(&irq4)),
        createInterruptHandlerEntry(@intFromPtr(&irq5)),
        createInterruptHandlerEntry(@intFromPtr(&irq6)),
        createInterruptHandlerEntry(@intFromPtr(&irq7)),
        createInterruptHandlerEntry(@intFromPtr(&irq8)),
        createInterruptHandlerEntry(@intFromPtr(&irq9)),
        createInterruptHandlerEntry(@intFromPtr(&irq10)),
        createInterruptHandlerEntry(@intFromPtr(&irq11)),
        createInterruptHandlerEntry(@intFromPtr(&irq12)),
        createInterruptHandlerEntry(@intFromPtr(&irq13)),
        createInterruptHandlerEntry(@intFromPtr(&irq14)),
        createInterruptHandlerEntry(@intFromPtr(&irq15)),
        createInterruptHandlerEntry(@intFromPtr(&irq16)),
        createInterruptHandlerEntry(@intFromPtr(&irq17)),
        createInterruptHandlerEntry(@intFromPtr(&irq18)),
        createInterruptHandlerEntry(@intFromPtr(&irq19)),
        createInterruptHandlerEntry(@intFromPtr(&irq20)),
        createInterruptHandlerEntry(@intFromPtr(&irq21)),
        createInterruptHandlerEntry(@intFromPtr(&irq22)),
        createInterruptHandlerEntry(@intFromPtr(&irq23)),
        createInterruptHandlerEntry(@intFromPtr(&irq24)),
        createInterruptHandlerEntry(@intFromPtr(&irq25)),
        createInterruptHandlerEntry(@intFromPtr(&irq26)),
        createInterruptHandlerEntry(@intFromPtr(&irq27)),
        createInterruptHandlerEntry(@intFromPtr(&irq28)),
        createInterruptHandlerEntry(@intFromPtr(&irq29)),
        createInterruptHandlerEntry(@intFromPtr(&irq30)),
        createInterruptHandlerEntry(@intFromPtr(&irq31)),
        createInterruptHandlerEntry(@intFromPtr(&irq32)),
        createInterruptHandlerEntry(@intFromPtr(&irq33)),
        createInterruptHandlerEntry(@intFromPtr(&irq34)),
        createInterruptHandlerEntry(@intFromPtr(&irq35)),
        createInterruptHandlerEntry(@intFromPtr(&irq36)),
        createInterruptHandlerEntry(@intFromPtr(&irq37)),
        createInterruptHandlerEntry(@intFromPtr(&irq38)),
        createInterruptHandlerEntry(@intFromPtr(&irq39)),
        createInterruptHandlerEntry(@intFromPtr(&irq40)),
        createInterruptHandlerEntry(@intFromPtr(&irq41)),
        createInterruptHandlerEntry(@intFromPtr(&irq42)),
        createInterruptHandlerEntry(@intFromPtr(&irq43)),
        createInterruptHandlerEntry(@intFromPtr(&irq44)),
        createInterruptHandlerEntry(@intFromPtr(&irq45)),
        createInterruptHandlerEntry(@intFromPtr(&irq46)),
        createInterruptHandlerEntry(@intFromPtr(&irq47)),
        createInterruptHandlerEntry(@intFromPtr(&irq48)),
        createInterruptHandlerEntry(@intFromPtr(&irq49)),
        createInterruptHandlerEntry(@intFromPtr(&irq50)),
        createInterruptHandlerEntry(@intFromPtr(&irq51)),
        createInterruptHandlerEntry(@intFromPtr(&irq52)),
        createInterruptHandlerEntry(@intFromPtr(&irq53)),
        createInterruptHandlerEntry(@intFromPtr(&irq54)),
        createInterruptHandlerEntry(@intFromPtr(&irq55)),
        createInterruptHandlerEntry(@intFromPtr(&irq56)),
        createInterruptHandlerEntry(@intFromPtr(&irq57)),
        createInterruptHandlerEntry(@intFromPtr(&irq58)),
        createInterruptHandlerEntry(@intFromPtr(&irq59)),
        createInterruptHandlerEntry(@intFromPtr(&irq60)),
        createInterruptHandlerEntry(@intFromPtr(&irq61)),
        createInterruptHandlerEntry(@intFromPtr(&irq62)),
        createInterruptHandlerEntry(@intFromPtr(&irq63)),
        createInterruptHandlerEntry(@intFromPtr(&irq64)),
        createInterruptHandlerEntry(@intFromPtr(&irq65)),
        createInterruptHandlerEntry(@intFromPtr(&irq66)),
        createInterruptHandlerEntry(@intFromPtr(&irq67)),
        createInterruptHandlerEntry(@intFromPtr(&irq68)),
        createInterruptHandlerEntry(@intFromPtr(&irq69)),
        createInterruptHandlerEntry(@intFromPtr(&irq70)),
        createInterruptHandlerEntry(@intFromPtr(&irq71)),
        createInterruptHandlerEntry(@intFromPtr(&irq72)),
        createInterruptHandlerEntry(@intFromPtr(&irq73)),
        createInterruptHandlerEntry(@intFromPtr(&irq74)),
        createInterruptHandlerEntry(@intFromPtr(&irq75)),
        createInterruptHandlerEntry(@intFromPtr(&irq76)),
        createInterruptHandlerEntry(@intFromPtr(&irq77)),
        createInterruptHandlerEntry(@intFromPtr(&irq78)),
        createInterruptHandlerEntry(@intFromPtr(&irq79)),
        createInterruptHandlerEntry(@intFromPtr(&irq80)),
        createInterruptHandlerEntry(@intFromPtr(&irq81)),
        createInterruptHandlerEntry(@intFromPtr(&irq82)),
        createInterruptHandlerEntry(@intFromPtr(&irq83)),
        createInterruptHandlerEntry(@intFromPtr(&irq84)),
        createInterruptHandlerEntry(@intFromPtr(&irq85)),
        createInterruptHandlerEntry(@intFromPtr(&irq86)),
        createInterruptHandlerEntry(@intFromPtr(&irq87)),
        createInterruptHandlerEntry(@intFromPtr(&irq88)),
        createInterruptHandlerEntry(@intFromPtr(&irq89)),
        createInterruptHandlerEntry(@intFromPtr(&irq90)),
        createInterruptHandlerEntry(@intFromPtr(&irq91)),
        createInterruptHandlerEntry(@intFromPtr(&irq92)),
        createInterruptHandlerEntry(@intFromPtr(&irq93)),
        createInterruptHandlerEntry(@intFromPtr(&irq94)),
        createInterruptHandlerEntry(@intFromPtr(&irq95)),
        createInterruptHandlerEntry(@intFromPtr(&irq96)),
        createInterruptHandlerEntry(@intFromPtr(&irq97)),
        createInterruptHandlerEntry(@intFromPtr(&irq98)),
        createInterruptHandlerEntry(@intFromPtr(&irq99)),
        createInterruptHandlerEntry(@intFromPtr(&irq100)),
        createInterruptHandlerEntry(@intFromPtr(&irq101)),
        createInterruptHandlerEntry(@intFromPtr(&irq102)),
        createInterruptHandlerEntry(@intFromPtr(&irq103)),
        createInterruptHandlerEntry(@intFromPtr(&irq104)),
        createInterruptHandlerEntry(@intFromPtr(&irq105)),
        createInterruptHandlerEntry(@intFromPtr(&irq106)),
        createInterruptHandlerEntry(@intFromPtr(&irq107)),
        createInterruptHandlerEntry(@intFromPtr(&irq108)),
        createInterruptHandlerEntry(@intFromPtr(&irq109)),
        createInterruptHandlerEntry(@intFromPtr(&irq110)),
        createInterruptHandlerEntry(@intFromPtr(&irq111)),
        createInterruptHandlerEntry(@intFromPtr(&irq112)),
        createInterruptHandlerEntry(@intFromPtr(&irq113)),
        createInterruptHandlerEntry(@intFromPtr(&irq114)),
        createInterruptHandlerEntry(@intFromPtr(&irq115)),
        createInterruptHandlerEntry(@intFromPtr(&irq116)),
        createInterruptHandlerEntry(@intFromPtr(&irq117)),
        createInterruptHandlerEntry(@intFromPtr(&irq118)),
        createInterruptHandlerEntry(@intFromPtr(&irq119)),
        createInterruptHandlerEntry(@intFromPtr(&irq120)),
        createInterruptHandlerEntry(@intFromPtr(&irq121)),
        createInterruptHandlerEntry(@intFromPtr(&irq122)),
        createInterruptHandlerEntry(@intFromPtr(&irq123)),
        createInterruptHandlerEntry(@intFromPtr(&irq124)),
        createInterruptHandlerEntry(@intFromPtr(&irq125)),
        createInterruptHandlerEntry(@intFromPtr(&irq126)),
        createInterruptHandlerEntry(@intFromPtr(&irq127)),
        createInterruptHandlerEntry(@intFromPtr(&irq128)),
        createInterruptHandlerEntry(@intFromPtr(&irq129)),
        createInterruptHandlerEntry(@intFromPtr(&irq130)),
        createInterruptHandlerEntry(@intFromPtr(&irq131)),
        createInterruptHandlerEntry(@intFromPtr(&irq132)),
        createInterruptHandlerEntry(@intFromPtr(&irq133)),
        createInterruptHandlerEntry(@intFromPtr(&irq134)),
        createInterruptHandlerEntry(@intFromPtr(&irq135)),
        createInterruptHandlerEntry(@intFromPtr(&irq136)),
        createInterruptHandlerEntry(@intFromPtr(&irq137)),
        createInterruptHandlerEntry(@intFromPtr(&irq138)),
        createInterruptHandlerEntry(@intFromPtr(&irq139)),
        createInterruptHandlerEntry(@intFromPtr(&irq140)),
        createInterruptHandlerEntry(@intFromPtr(&irq141)),
        createInterruptHandlerEntry(@intFromPtr(&irq142)),
        createInterruptHandlerEntry(@intFromPtr(&irq143)),
        createInterruptHandlerEntry(@intFromPtr(&irq144)),
        createInterruptHandlerEntry(@intFromPtr(&irq145)),
        createInterruptHandlerEntry(@intFromPtr(&irq146)),
        createInterruptHandlerEntry(@intFromPtr(&irq147)),
        createInterruptHandlerEntry(@intFromPtr(&irq148)),
        createInterruptHandlerEntry(@intFromPtr(&irq149)),
        createInterruptHandlerEntry(@intFromPtr(&irq150)),
        createInterruptHandlerEntry(@intFromPtr(&irq151)),
        createInterruptHandlerEntry(@intFromPtr(&irq152)),
        createInterruptHandlerEntry(@intFromPtr(&irq153)),
        createInterruptHandlerEntry(@intFromPtr(&irq154)),
        createInterruptHandlerEntry(@intFromPtr(&irq155)),
        createInterruptHandlerEntry(@intFromPtr(&irq156)),
        createInterruptHandlerEntry(@intFromPtr(&irq157)),
        createInterruptHandlerEntry(@intFromPtr(&irq158)),
        createInterruptHandlerEntry(@intFromPtr(&irq159)),
        createInterruptHandlerEntry(@intFromPtr(&irq160)),
        createInterruptHandlerEntry(@intFromPtr(&irq161)),
        createInterruptHandlerEntry(@intFromPtr(&irq162)),
        createInterruptHandlerEntry(@intFromPtr(&irq163)),
        createInterruptHandlerEntry(@intFromPtr(&irq164)),
        createInterruptHandlerEntry(@intFromPtr(&irq165)),
        createInterruptHandlerEntry(@intFromPtr(&irq166)),
        createInterruptHandlerEntry(@intFromPtr(&irq167)),
        createInterruptHandlerEntry(@intFromPtr(&irq168)),
        createInterruptHandlerEntry(@intFromPtr(&irq169)),
        createInterruptHandlerEntry(@intFromPtr(&irq170)),
        createInterruptHandlerEntry(@intFromPtr(&irq171)),
        createInterruptHandlerEntry(@intFromPtr(&irq172)),
        createInterruptHandlerEntry(@intFromPtr(&irq173)),
        createInterruptHandlerEntry(@intFromPtr(&irq174)),
        createInterruptHandlerEntry(@intFromPtr(&irq175)),
        createInterruptHandlerEntry(@intFromPtr(&irq176)),
        createInterruptHandlerEntry(@intFromPtr(&irq177)),
        createInterruptHandlerEntry(@intFromPtr(&irq178)),
        createInterruptHandlerEntry(@intFromPtr(&irq179)),
        createInterruptHandlerEntry(@intFromPtr(&irq180)),
        createInterruptHandlerEntry(@intFromPtr(&irq181)),
        createInterruptHandlerEntry(@intFromPtr(&irq182)),
        createInterruptHandlerEntry(@intFromPtr(&irq183)),
        createInterruptHandlerEntry(@intFromPtr(&irq184)),
        createInterruptHandlerEntry(@intFromPtr(&irq185)),
        createInterruptHandlerEntry(@intFromPtr(&irq186)),
        createInterruptHandlerEntry(@intFromPtr(&irq187)),
        createInterruptHandlerEntry(@intFromPtr(&irq188)),
        createInterruptHandlerEntry(@intFromPtr(&irq189)),
        createInterruptHandlerEntry(@intFromPtr(&irq190)),
        createInterruptHandlerEntry(@intFromPtr(&irq191)),
        createInterruptHandlerEntry(@intFromPtr(&irq192)),
        createInterruptHandlerEntry(@intFromPtr(&irq193)),
        createInterruptHandlerEntry(@intFromPtr(&irq194)),
        createInterruptHandlerEntry(@intFromPtr(&irq195)),
        createInterruptHandlerEntry(@intFromPtr(&irq196)),
        createInterruptHandlerEntry(@intFromPtr(&irq197)),
        createInterruptHandlerEntry(@intFromPtr(&irq198)),
        createInterruptHandlerEntry(@intFromPtr(&irq199)),
        createInterruptHandlerEntry(@intFromPtr(&irq200)),
        createInterruptHandlerEntry(@intFromPtr(&irq201)),
        createInterruptHandlerEntry(@intFromPtr(&irq202)),
        createInterruptHandlerEntry(@intFromPtr(&irq203)),
        createInterruptHandlerEntry(@intFromPtr(&irq204)),
        createInterruptHandlerEntry(@intFromPtr(&irq205)),
        createInterruptHandlerEntry(@intFromPtr(&irq206)),
        createInterruptHandlerEntry(@intFromPtr(&irq207)),
        createInterruptHandlerEntry(@intFromPtr(&irq208)),
        createInterruptHandlerEntry(@intFromPtr(&irq209)),
        createInterruptHandlerEntry(@intFromPtr(&irq210)),
        createInterruptHandlerEntry(@intFromPtr(&irq211)),
        createInterruptHandlerEntry(@intFromPtr(&irq212)),
        createInterruptHandlerEntry(@intFromPtr(&irq213)),
        createInterruptHandlerEntry(@intFromPtr(&irq214)),
        createInterruptHandlerEntry(@intFromPtr(&irq215)),
        createInterruptHandlerEntry(@intFromPtr(&irq216)),
        createInterruptHandlerEntry(@intFromPtr(&irq217)),
        createInterruptHandlerEntry(@intFromPtr(&irq218)),
        createInterruptHandlerEntry(@intFromPtr(&irq219)),
        createInterruptHandlerEntry(@intFromPtr(&irq220)),
        createInterruptHandlerEntry(@intFromPtr(&irq221)),
        createInterruptHandlerEntry(@intFromPtr(&irq222)),
        createInterruptHandlerEntry(@intFromPtr(&irq223)),
        createInterruptHandlerEntry(@intFromPtr(&irq224)),
        createInterruptHandlerEntry(@intFromPtr(&irq225)),
        createInterruptHandlerEntry(@intFromPtr(&irq226)),
        createInterruptHandlerEntry(@intFromPtr(&irq227)),
        createInterruptHandlerEntry(@intFromPtr(&irq228)),
        createInterruptHandlerEntry(@intFromPtr(&irq229)),
        createInterruptHandlerEntry(@intFromPtr(&irq230)),
        createInterruptHandlerEntry(@intFromPtr(&irq231)),
        createInterruptHandlerEntry(@intFromPtr(&irq232)),
        createInterruptHandlerEntry(@intFromPtr(&irq233)),
        createInterruptHandlerEntry(@intFromPtr(&irq234)),
        createInterruptHandlerEntry(@intFromPtr(&irq235)),
        createInterruptHandlerEntry(@intFromPtr(&irq236)),
        createInterruptHandlerEntry(@intFromPtr(&irq237)),
        createInterruptHandlerEntry(@intFromPtr(&irq238)),
        createInterruptHandlerEntry(@intFromPtr(&irq239)),
        createInterruptHandlerEntry(@intFromPtr(&irq240)),
        createInterruptHandlerEntry(@intFromPtr(&irq241)),
        createInterruptHandlerEntry(@intFromPtr(&irq242)),
        createInterruptHandlerEntry(@intFromPtr(&irq243)),
        createInterruptHandlerEntry(@intFromPtr(&irq244)),
        createInterruptHandlerEntry(@intFromPtr(&irq245)),
        createInterruptHandlerEntry(@intFromPtr(&irq246)),
        createInterruptHandlerEntry(@intFromPtr(&irq247)),
        createInterruptHandlerEntry(@intFromPtr(&irq248)),
        createInterruptHandlerEntry(@intFromPtr(&irq249)),
        createInterruptHandlerEntry(@intFromPtr(&irq250)),
        createInterruptHandlerEntry(@intFromPtr(&irq251)),
        createInterruptHandlerEntry(@intFromPtr(&irq252)),
        createInterruptHandlerEntry(@intFromPtr(&irq253)),
        createInterruptHandlerEntry(@intFromPtr(&irq254)),
        createInterruptHandlerEntry(@intFromPtr(&irq255)),
    };

    const idtr = IdtRegister{
        .size = @sizeOf(GateDescriptor) * 256 - 1,
        .offset = @intFromPtr(&idt),
    };

    asm volatile ("lidt (%[value])"
        :
        : [value] "{rax}" (&idtr),
    );
}

fn createInterruptHandlerEntry(interrupt_handler_address: u64) GateDescriptor {
    const segment_selector = SegmentSelector{
        .rpl = 0b00, // Ring 0 (kernel)
        .ti = 0b0, // Use GDT instead of LDT
        .index = 0b0000000000101, // GDT code segment
    };

    const type_attributes = TypeAttributes{
        .gate_type = 0b1110, // 64-bit interrupt gate
        .zero = 0b0, // Reserved (should be zero)
        .dpl = 0b00, // Ring 0 (kernel)
        .p = 0b1, // Present
    };

    const offset: Offset = @bitCast(interrupt_handler_address);

    return .{
        .offset_low = offset.low,
        .selector = segment_selector,
        .ist = 0,
        .type_attributes = type_attributes,
        .offset_middle = offset.middle,
        .offset_high = offset.high,
        .zero = 0,
    };
}

export fn interruptHandler(stack_frame: *InterruptStackFrame) callconv(.C) void {
    switch (stack_frame.irq) {
        0 => std.debug.panic("IRQ 0: Division Error", .{}),
        1 => std.debug.panic("IRQ 1: Debug", .{}),
        2 => std.debug.panic("IRQ 2: Non-Maskable Interrupt", .{}),
        3 => std.debug.panic("IRQ 3: Breakpoint", .{}),
        4 => std.debug.panic("IRQ 4: Overflow", .{}),
        5 => std.debug.panic("IRQ 5: Bound Range Exceeded", .{}),
        6 => std.debug.panic("IRQ 6: Invalid Opcode", .{}),
        7 => std.debug.panic("IRQ 7: Device Not Available", .{}),
        8 => std.debug.panic("IRQ 8: Double Fault: {X}", .{stack_frame.error_code}),
        9 => std.debug.panic("IRQ 9: Coprocessor Segment Overrun", .{}),
        10 => std.debug.panic("IRQ 10: Invalid TSS: {X}", .{stack_frame.error_code}),
        11 => std.debug.panic("IRQ 11: Segment Not Present: {X}", .{stack_frame.error_code}),
        12 => std.debug.panic("IRQ 12: Stack-Segment Fault: {X}", .{stack_frame.error_code}),
        13 => std.debug.panic("IRQ 13: General Protection Fault: {X}", .{stack_frame.error_code}),
        14 => std.debug.panic("IRQ 14: Page Fault: {X}", .{stack_frame.error_code}),
        15 => std.debug.panic("IRQ 15: Reserved", .{}),
        16 => std.debug.panic("IRQ 16: x87 Floating-Point Exception", .{}),
        17 => std.debug.panic("IRQ 17: Alignment Check: {X}", .{stack_frame.error_code}),
        18 => std.debug.panic("IRQ 18: Machine Check", .{}),
        19 => std.debug.panic("IRQ 19: SIMD Floating-Point Exception", .{}),
        20 => std.debug.panic("IRQ 20: Virtualization Exception", .{}),
        21 => std.debug.panic("IRQ 21: Control Protection Exception: {d}", .{stack_frame.error_code}),
        22 => std.debug.panic("IRQ 22: Reserved", .{}),
        23 => std.debug.panic("IRQ 23: Reserved", .{}),
        24 => std.debug.panic("IRQ 24: Reserved", .{}),
        25 => std.debug.panic("IRQ 25: Reserved", .{}),
        26 => std.debug.panic("IRQ 26: Reserved", .{}),
        27 => std.debug.panic("IRQ 27: Reserved", .{}),
        28 => std.debug.panic("IRQ 28: Hypervisor Injection Exception", .{}),
        29 => std.debug.panic("IRQ 29: VMM Communication Exception: {X}", .{stack_frame.error_code}),
        30 => std.debug.panic("IRQ 30: Security Exception: {X}", .{stack_frame.error_code}),
        31 => std.debug.panic("IRQ 31: Reserved", .{}),
        else => {
            apic.sendEoi();
        },
    }
}

extern fn irq0() void;
extern fn irq1() void;
extern fn irq2() void;
extern fn irq3() void;
extern fn irq4() void;
extern fn irq5() void;
extern fn irq6() void;
extern fn irq7() void;
extern fn irq8() void;
extern fn irq9() void;
extern fn irq10() void;
extern fn irq11() void;
extern fn irq12() void;
extern fn irq13() void;
extern fn irq14() void;
extern fn irq15() void;
extern fn irq16() void;
extern fn irq17() void;
extern fn irq18() void;
extern fn irq19() void;
extern fn irq20() void;
extern fn irq21() void;
extern fn irq22() void;
extern fn irq23() void;
extern fn irq24() void;
extern fn irq25() void;
extern fn irq26() void;
extern fn irq27() void;
extern fn irq28() void;
extern fn irq29(error_code: *u64) void;
extern fn irq30(error_code: *u64) void;
extern fn irq31() void;
extern fn irq32() void;
extern fn irq33() void;
extern fn irq34() void;
extern fn irq35() void;
extern fn irq36() void;
extern fn irq37() void;
extern fn irq38() void;
extern fn irq39() void;
extern fn irq40() void;
extern fn irq41() void;
extern fn irq42() void;
extern fn irq43() void;
extern fn irq44() void;
extern fn irq45() void;
extern fn irq46() void;
extern fn irq47() void;
extern fn irq48() void;
extern fn irq49() void;
extern fn irq50() void;
extern fn irq51() void;
extern fn irq52() void;
extern fn irq53() void;
extern fn irq54() void;
extern fn irq55() void;
extern fn irq56() void;
extern fn irq57() void;
extern fn irq58() void;
extern fn irq59() void;
extern fn irq60() void;
extern fn irq61() void;
extern fn irq62() void;
extern fn irq63() void;
extern fn irq64() void;
extern fn irq65() void;
extern fn irq66() void;
extern fn irq67() void;
extern fn irq68() void;
extern fn irq69() void;
extern fn irq70() void;
extern fn irq71() void;
extern fn irq72() void;
extern fn irq73() void;
extern fn irq74() void;
extern fn irq75() void;
extern fn irq76() void;
extern fn irq77() void;
extern fn irq78() void;
extern fn irq79() void;
extern fn irq80() void;
extern fn irq81() void;
extern fn irq82() void;
extern fn irq83() void;
extern fn irq84() void;
extern fn irq85() void;
extern fn irq86() void;
extern fn irq87() void;
extern fn irq88() void;
extern fn irq89() void;
extern fn irq90() void;
extern fn irq91() void;
extern fn irq92() void;
extern fn irq93() void;
extern fn irq94() void;
extern fn irq95() void;
extern fn irq96() void;
extern fn irq97() void;
extern fn irq98() void;
extern fn irq99() void;
extern fn irq100() void;
extern fn irq101() void;
extern fn irq102() void;
extern fn irq103() void;
extern fn irq104() void;
extern fn irq105() void;
extern fn irq106() void;
extern fn irq107() void;
extern fn irq108() void;
extern fn irq109() void;
extern fn irq110() void;
extern fn irq111() void;
extern fn irq112() void;
extern fn irq113() void;
extern fn irq114() void;
extern fn irq115() void;
extern fn irq116() void;
extern fn irq117() void;
extern fn irq118() void;
extern fn irq119() void;
extern fn irq120() void;
extern fn irq121() void;
extern fn irq122() void;
extern fn irq123() void;
extern fn irq124() void;
extern fn irq125() void;
extern fn irq126() void;
extern fn irq127() void;
extern fn irq128() void;
extern fn irq129() void;
extern fn irq130() void;
extern fn irq131() void;
extern fn irq132() void;
extern fn irq133() void;
extern fn irq134() void;
extern fn irq135() void;
extern fn irq136() void;
extern fn irq137() void;
extern fn irq138() void;
extern fn irq139() void;
extern fn irq140() void;
extern fn irq141() void;
extern fn irq142() void;
extern fn irq143() void;
extern fn irq144() void;
extern fn irq145() void;
extern fn irq146() void;
extern fn irq147() void;
extern fn irq148() void;
extern fn irq149() void;
extern fn irq150() void;
extern fn irq151() void;
extern fn irq152() void;
extern fn irq153() void;
extern fn irq154() void;
extern fn irq155() void;
extern fn irq156() void;
extern fn irq157() void;
extern fn irq158() void;
extern fn irq159() void;
extern fn irq160() void;
extern fn irq161() void;
extern fn irq162() void;
extern fn irq163() void;
extern fn irq164() void;
extern fn irq165() void;
extern fn irq166() void;
extern fn irq167() void;
extern fn irq168() void;
extern fn irq169() void;
extern fn irq170() void;
extern fn irq171() void;
extern fn irq172() void;
extern fn irq173() void;
extern fn irq174() void;
extern fn irq175() void;
extern fn irq176() void;
extern fn irq177() void;
extern fn irq178() void;
extern fn irq179() void;
extern fn irq180() void;
extern fn irq181() void;
extern fn irq182() void;
extern fn irq183() void;
extern fn irq184() void;
extern fn irq185() void;
extern fn irq186() void;
extern fn irq187() void;
extern fn irq188() void;
extern fn irq189() void;
extern fn irq190() void;
extern fn irq191() void;
extern fn irq192() void;
extern fn irq193() void;
extern fn irq194() void;
extern fn irq195() void;
extern fn irq196() void;
extern fn irq197() void;
extern fn irq198() void;
extern fn irq199() void;
extern fn irq200() void;
extern fn irq201() void;
extern fn irq202() void;
extern fn irq203() void;
extern fn irq204() void;
extern fn irq205() void;
extern fn irq206() void;
extern fn irq207() void;
extern fn irq208() void;
extern fn irq209() void;
extern fn irq210() void;
extern fn irq211() void;
extern fn irq212() void;
extern fn irq213() void;
extern fn irq214() void;
extern fn irq215() void;
extern fn irq216() void;
extern fn irq217() void;
extern fn irq218() void;
extern fn irq219() void;
extern fn irq220() void;
extern fn irq221() void;
extern fn irq222() void;
extern fn irq223() void;
extern fn irq224() void;
extern fn irq225() void;
extern fn irq226() void;
extern fn irq227() void;
extern fn irq228() void;
extern fn irq229() void;
extern fn irq230() void;
extern fn irq231() void;
extern fn irq232() void;
extern fn irq233() void;
extern fn irq234() void;
extern fn irq235() void;
extern fn irq236() void;
extern fn irq237() void;
extern fn irq238() void;
extern fn irq239() void;
extern fn irq240() void;
extern fn irq241() void;
extern fn irq242() void;
extern fn irq243() void;
extern fn irq244() void;
extern fn irq245() void;
extern fn irq246() void;
extern fn irq247() void;
extern fn irq248() void;
extern fn irq249() void;
extern fn irq250() void;
extern fn irq251() void;
extern fn irq252() void;
extern fn irq253() void;
extern fn irq254() void;
extern fn irq255() void;
