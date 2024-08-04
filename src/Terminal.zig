const std = @import("std");

const Terminal = @This();

ptr: *anyopaque,
read: *const fn (ptr: *anyopaque) u8,
write: *const fn (ptr: *anyopaque, char: u8) void,

pub fn init(
    pointer: anytype,
    comptime read_fn: fn (self: @TypeOf(pointer)) u8,
    comptime write_fn: fn (self: @TypeOf(pointer), char: u8) void,
) Terminal {
    const Ptr = @TypeOf(pointer);
    const ptr_info = @typeInfo(Ptr);

    std.debug.assert(ptr_info == .Pointer); // Must be a pointer
    std.debug.assert(ptr_info.Pointer.size == .One); // Must be a single-item pointer

    const gen = struct {
        fn readFn(ptr: *anyopaque) u8 {
            const self: Ptr = @ptrCast(@alignCast(ptr));
            return @call(.always_inline, read_fn, .{self});
        }

        fn writeFn(ptr: *anyopaque, char: u8) void {
            const self: Ptr = @ptrCast(@alignCast(ptr));
            return @call(.always_inline, write_fn, .{ self, char });
        }
    };

    return .{
        .ptr = pointer,
        .read = gen.readFn,
        .write = gen.writeFn,
    };
}

pub fn readChar(self: Terminal) u8 {
    return self.read(self.ptr);
}

pub fn writeChar(self: Terminal, char: u8) void {
    self.write(self.ptr, char);
}

pub fn writeString(self: Terminal, string: []const u8) void {
    for (string) |char| self.writeChar(char);
}

pub fn debugPrint(self: Terminal, comptime format: []const u8, args: anytype) !void {
    var buffer: [1024]u8 = undefined;
    const slice = try std.fmt.bufPrint(&buffer, format, args);
    self.writeString(slice);
}
