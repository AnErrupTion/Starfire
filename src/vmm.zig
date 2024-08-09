const pmm = @import("pmm.zig");
const paging = @import("paging.zig");

var paging_hhdm_offset: u64 = undefined;

pub fn init(hhdm_offset: u64) void {
    paging_hhdm_offset = hhdm_offset;
}

pub fn allocate(size: u64) error{OutOfMemory}!u64 {
    const physical_address = try pmm.allocate(size);
    const virtual_address = paging_hhdm_offset + physical_address;

    try paging.map(physical_address, @bitCast(virtual_address), paging.PRESENT_BIT | paging.READ_WRITE_BIT);

    return virtual_address;
}

pub fn free(address: u64, size: u64) void {
    pmm.free(address - paging_hhdm_offset, size);
}
