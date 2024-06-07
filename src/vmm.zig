const pmm = @import("pmm.zig");

var paging_hhdm_offset: u64 = undefined;

pub fn init(hhdm_offset: u64) void {
    paging_hhdm_offset = hhdm_offset;
}

pub fn allocate(size: u64) error{OutOfMemory}!u64 {
    return paging_hhdm_offset + try pmm.allocate(size);
}

pub fn free(address: u64, size: u64) void {
    pmm.free(address - paging_hhdm_offset, size);
}
