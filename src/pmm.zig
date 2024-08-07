const std = @import("std");
const limine = @import("limine");
const Bitmap = @import("Bitmap.zig");

pub const PAGE_SIZE: usize = 4096; // In bytes

pub var bitmap: Bitmap = undefined;
pub var total_byte_count: usize = 0;

pub fn init(hhdm_offset: u64, entries: []*limine.MemoryMapEntry) void {
    for (entries) |entry| total_byte_count += entry.length;

    const physical_page_count = total_byte_count / PAGE_SIZE;
    const total_bitmap_byte_count = physical_page_count * @sizeOf(bool); // The number of bytes needed to represent all physical pages
    const total_bitmap_page_count = total_bitmap_byte_count / PAGE_SIZE; // The number of physical pages needed to represent the bytes

    // Find the first memory region that can fit the bitmap
    var map_best_address: u64 = 0;
    var found_best_address = false;
    for (entries) |entry| {
        if (entry.kind != .usable or entry.length < total_bitmap_byte_count) continue;

        map_best_address = entry.base;
        found_best_address = true;
        break;
    }

    if (!found_best_address) std.debug.panic("PMM: Not enough memory to allocate bitmap", .{});

    const array: [*]allowzero volatile bool = @ptrFromInt(hhdm_offset + map_best_address);
    bitmap = Bitmap.init(PAGE_SIZE, physical_page_count, array);

    const map_best_page = map_best_address / PAGE_SIZE;
    const map_end_page = map_best_page + total_bitmap_page_count;

    // Reserve all pages needed for the bitmap and mark all unusable pages as allocated
    for (0..physical_page_count) |i| {
        const is_page_for_bitmap = i >= map_best_page and i <= map_end_page;

        // If i is less than total_bitmap_page_count, then it's a page that's used for the bitmap so we mark it as allocated.
        // Otherwise, we mark it as free
        bitmap.array[i] = is_page_for_bitmap;

        // If the page is used for the bitmap, we skip the rest of the loop because we already know it's usable
        if (is_page_for_bitmap) continue;

        const page_address = i * PAGE_SIZE;
        var found_any_entry = false;

        for (entries) |entry| {
            const end_address = entry.base + entry.length;

            if (page_address >= entry.base and page_address <= end_address) {
                found_any_entry = true;

                if (entry.kind != .usable) {
                    bitmap.array[i] = true;
                    break; // We can safely break out of the loop here because a bitmap entry can only contain 1 page
                }
            }
        }

        // If we haven't found any entry whatsoever, then there's a hole in the memory map, mark the page as allocated
        // (it's most likely reserved)
        if (!found_any_entry) bitmap.array[i] = true;
    }
}

pub fn allocate(size: u64) error{OutOfMemory}!u64 {
    const pages = bitmap.getPageCount(size);
    return bitmap.allocateNext(pages);
}

pub fn free(address: u64, size: u64) void {
    const pages = bitmap.getPageCount(size);
    bitmap.free(address, pages);
}
