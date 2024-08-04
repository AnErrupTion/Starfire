const std = @import("std");
const port = @import("x86/port.zig");

pub const COM1: u16 = 0x3F8;
pub const COM2: u16 = 0x2F8;
pub const COM3: u16 = 0x3E8;
pub const COM4: u16 = 0x2E8;
pub const COM5: u16 = 0x5F8;
pub const COM6: u16 = 0x4F8;
pub const COM7: u16 = 0x5E8;
pub const COM8: u16 = 0x4E8;

const UART_TPS: u32 = 115200;

const DATA_REGISTER: u8 = 0x00;
const INTERRUPT_ENABLE_REGISTER: u8 = 0x01;
const SET_BAUD_RATE_DIVISOR_LOW_BYTE: u8 = 0x00;
const SET_BAUD_RATE_DIVISOR_HIGH_BYTE: u8 = 0x01;
const FIFO_CONTROL_REGISTER: u8 = 0x02;
const LINE_CONTROL_REGISTER: u8 = 0x03;
const MODEM_CONTROL_REGISTER: u8 = 0x04;
const LINE_STATUS_REGISTER: u8 = 0x05;

const Word = packed struct {
    low: u8,
    high: u8,
};

pub fn init(com_port: u16, baud_rate: u16) void {
    const baud_rate_u16: u16 = @intCast(UART_TPS / baud_rate);
    const baud_rate_word: Word = @bitCast(baud_rate_u16);

    // Disable all interrupts
    port.outb(com_port + INTERRUPT_ENABLE_REGISTER, 0x00);

    // Enable DLAB (set baud rate divisor)
    port.outb(com_port + LINE_CONTROL_REGISTER, 0x80);
    port.outb(com_port + SET_BAUD_RATE_DIVISOR_LOW_BYTE, baud_rate_word.low);
    port.outb(com_port + SET_BAUD_RATE_DIVISOR_HIGH_BYTE, baud_rate_word.high);

    // Set the line protocol to be 8N1 (8 bits, no parity, one stop bit)
    port.outb(com_port + LINE_CONTROL_REGISTER, 0x03);

    // Enable FIFO and clear it with a 14-byte threshold
    port.outb(com_port + FIFO_CONTROL_REGISTER, 0xC7);

    // Enable all interrupts and set the Request To Send (RTS) & Data Set Ready (DSR) bits
    port.outb(com_port + MODEM_CONTROL_REGISTER, 0x0F);
}

pub fn read(com_port: u16) u8 {
    while ((port.inb(com_port + LINE_STATUS_REGISTER) & 0x01) == 0x00) {
        // Wait for data to be received
    }

    return port.inb(com_port + DATA_REGISTER);
}

pub fn writeChar(com_port: u16, char: u8) void {
    while ((port.inb(com_port + LINE_STATUS_REGISTER) & 0x20) == 0x00) {
        // Wait for empty transmit buffer
    }

    port.outb(com_port + DATA_REGISTER, char);
}

pub fn writeString(com_port: u16, string: []const u8) void {
    for (string) |char| writeChar(com_port, char);
}

pub fn debugPrint(com_port: u16, comptime format: []const u8, args: anytype) !void {
    var buffer: [1024]u8 = undefined;
    const slice = try std.fmt.bufPrint(&buffer, format, args);
    writeString(com_port, slice);
}
