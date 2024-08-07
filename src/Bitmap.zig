const Bitmap = @This();

page_size: usize,
physical_page_count: usize,
array: [*]allowzero volatile bool,

pub fn init(page_size: usize, physical_page_count: usize, array: [*]allowzero volatile bool) Bitmap {
    return .{
        .page_size = page_size,
        .physical_page_count = physical_page_count,
        .array = array,
    };
}

pub fn set(self: Bitmap, start_page: usize, end_page: usize, allocated: bool) void {
    @memset(self.array[start_page..end_page], allocated);
}

pub fn allocateNext(self: Bitmap, pages: usize) error{OutOfMemory}!usize {
    // Find the correct amount of consecutive pages
    var satisfied_pages: usize = 0;
    for (0..self.physical_page_count) |i| {
        if (self.array[i]) {
            satisfied_pages = 0;
            continue;
        }

        satisfied_pages += 1;

        if (satisfied_pages == pages) {
            for (0..pages) |j| self.array[i - j] = true;
            return (i - pages + 1) * self.page_size; // We add 1 to the index because this check happens at the last allocated page
        }
    }

    return error.OutOfMemory;
}

pub fn free(self: Bitmap, address: usize, pages: usize) void {
    if (address % self.page_size != 0) return; // Address is not page aligned so we just ignore

    const start_page = address / self.page_size;
    const end_page = start_page + pages;

    if (start_page > self.physical_page_count) return; // Address is out of bounds so we just ignore

    for (start_page..end_page) |i| self.array[i] = false;
}

pub fn getPageCount(self: Bitmap, size: usize) usize {
    // Pad size to nearest PAGE_SIZE
    const padded_size = if (size % self.page_size != 0) size + self.page_size - (size % self.page_size) else size;
    return padded_size / self.page_size;
}
