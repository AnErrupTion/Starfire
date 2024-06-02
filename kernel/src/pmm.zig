const std = @import("std");
const limine = @import("limine");

pub const PAGE_SIZE = 4096; // In bytes

var bitmap: [*]allowzero volatile bool = undefined;
pub var total_page_count: u64 = 0; // The number of physical pages in the system
pub var total_bitmap_byte_count: u64 = 0; // The number of bytes needed to represent all physical pages
pub var total_bitmap_page_count: u64 = 0; // The number of physical pages needed to represent the bytes

pub fn init(hhdm_offset: u64, entries: []*limine.MemoryMapEntry) void {
    var total_entry_size: u64 = 0;
    for (entries) |entry| total_entry_size += entry.length;

    total_page_count = total_entry_size / PAGE_SIZE;
    total_bitmap_byte_count = total_page_count * @sizeOf(bool);
    total_bitmap_page_count = total_bitmap_byte_count / PAGE_SIZE;

    // Find the first memory region that can fit the bitmap
    var map_best_address: u64 = 0;
    var found_best_address = false;
    for (entries) |entry| {
        if (total_bitmap_byte_count > entry.length) continue;

        map_best_address = entry.base;
        found_best_address = true;
        break;
    }

    if (!found_best_address) std.debug.panic("PMM: Not enough memory to allocate bitmap", .{});

    bitmap = @ptrFromInt(hhdm_offset + map_best_address);

    // Reserve all pages needed for the bitmap
    for (0..total_bitmap_page_count) |i| bitmap[i] = true;

    // Mark all unusable pages as allocated
    for (0..total_page_count) |i| {
        const page_address = i * PAGE_SIZE;

        for (entries) |entry| {
            if (entry.kind != .usable and page_address >= entry.base and page_address <= entry.base + entry.length) {
                bitmap[i] = true;
                break; // We can safely break out of the loop here because a bitmap entry can only contain 1 page
            }
        }
    }
}

pub fn allocate(size: u64) error{OutOfMemory}!u64 {
    const padded_size = if (size % PAGE_SIZE != 0) size + PAGE_SIZE - (size % PAGE_SIZE) else size; // Pad size to nearest PAGE_SIZE
    const required_page_count = padded_size / PAGE_SIZE;

    // Find required_page_count consecutive pages
    var satisfied_pages: u64 = 0;
    for (0..total_page_count) |i| {
        if (bitmap[i]) {
            for (0..satisfied_pages) |j| bitmap[i - 1 - j] = false;
            satisfied_pages = 0;
            continue;
        }

        bitmap[i] = true;
        satisfied_pages += 1;

        if (satisfied_pages == required_page_count) {
            // We add 1 to the index because this check happens at the last allocated page
            return (i - required_page_count + 1) * PAGE_SIZE;
        }
    }

    return error.OutOfMemory;
}

pub fn free(address: u64, size: u64) void {
    if (address % PAGE_SIZE != 0) return; // Address is not page aligned so we just ignore

    const padded_size = if (size % PAGE_SIZE != 0) size + PAGE_SIZE - (size % PAGE_SIZE) else size; // Pad size to nearest PAGE_SIZE
    const required_page_count = padded_size / PAGE_SIZE;

    const start_page = address / PAGE_SIZE;
    const end_page = start_page + required_page_count;

    if (start_page > total_page_count) return; // Address is out of bounds so we just ignore

    for (start_page..end_page) |i| bitmap[i] = false;
}
