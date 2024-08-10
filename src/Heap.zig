const std = @import("std");
const vmm = @import("vmm.zig");

const Heap = @This();

const NEW_ALLOCATION_SIZE: usize = 8192;

const Node = struct {
    address: usize,
    size: usize,
    used: bool,
    previous: ?*Node,
    next: ?*Node,
};

start_node: *Node,
current_node: *Node,

pub fn init(initial_size: usize) !Heap {
    const start_address = try vmm.allocate(initial_size);

    var start_node: *Node = @ptrFromInt(start_address);
    start_node.address = start_address + @sizeOf(Node);
    start_node.size = initial_size;
    start_node.used = false;
    start_node.previous = null;
    start_node.next = null;

    return .{
        .start_node = start_node,
        .current_node = start_node,
    };
}

pub fn allocate(self: *Heap, size: usize) !usize {
    // Check if we can find an existing node to return instead
    var node: ?*Node = self.start_node;

    while (node != null) : (node = node.?.next) {
        if (node.?.used or node.?.size < size) continue;
        if (node.?.size == size) {
            node.?.used = true;
            return node.?.address;
        }

        const address = node.?.address + size;

        // Split the node
        var new_node: *Node = @ptrFromInt(address);
        new_node.address = address + @sizeOf(Node);
        new_node.size = node.?.size - size - @sizeOf(Node);
        new_node.used = true;
        new_node.previous = node.?;
        new_node.next = node.?.next;

        // Update the pointers
        if (node.?.next) |next| next.previous = new_node;
        node.?.next = new_node;

        return node.?.address;
    }

    const next_address = self.current_node.address + size;

    // Check if we need to allocate a new node
    if (next_address >= @intFromPtr(self.start_node) + self.start_node.size) {
        const new_size = size + NEW_ALLOCATION_SIZE;
        const new_address = try vmm.allocate(new_size);

        // Create the new node
        var next: *Node = @ptrFromInt(new_address);
        next.address = new_address + @sizeOf(Node);
        next.size = new_size;
        next.used = false;
        next.previous = self.current_node;
        next.next = null;

        // Update the pointers
        self.current_node.next = next;
        self.current_node = next;

        // To start splitting again (if needed)
        return try self.allocate(size);
    }

    var next: *Node = @ptrFromInt(next_address);
    next.address = next_address + @sizeOf(Node);
    next.size = undefined;
    next.used = false;
    next.previous = self.current_node;
    next.next = null;

    self.current_node.size = size;
    self.current_node.used = true;
    self.current_node.next = next;
    self.current_node = next;

    return self.current_node.address;
}

pub fn free(self: *Heap, address: usize) void {
    merge_next_node: {
        if (self.current_node.next) |next| {
            if (next.used) break :merge_next_node;
            self.current_node.size += next.size + @sizeOf(Node);
            self.current_node.next = next.next;

            if (next.next) |next_next| next_next.previous = self.current_node;
        }
    }

    merge_previous_node: {
        if (self.current_node.previous) |previous| {
            if (previous.used) break :merge_previous_node;
            previous.size += self.current_node.size + @sizeOf(Node);
            previous.next = self.current_node.next;

            if (self.current_node.next) |next| next.previous = previous;
        }
    }

    const node: *Node = @ptrFromInt(address - @sizeOf(Node));
    if (node.used) node.used = false;
}
