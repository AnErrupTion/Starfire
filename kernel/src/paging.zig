const pmm = @import("pmm.zig");
const serial = @import("serial.zig");

const TABLE_ENTRIES: u64 = 512;
const ENTRY_SIZE: u64 = 8; // In bytes
const TABLE_SIZE = TABLE_ENTRIES * ENTRY_SIZE; // In bytes

const VirtualAddress = packed struct {
    sign_extension: u16,
    pml4_index: u9,
    pdpr_index: u9,
    pd_index: u9,
    pt_index: u9,
    offset: u12,
};

// Those are defined in the linker script
extern const TEXT_START: u64;
extern const TEXT_END: u64;
extern const RODATA_START: u64;
extern const RODATA_END: u64;
extern const DATA_START: u64;
extern const DATA_END: u64;

var initial_hhdm_offset: u64 = undefined;
var initial_kernel_physical_base: u64 = undefined;
var initial_kernel_virtual_base: u64 = undefined;

pub fn init(hhdm_offset: u64, kernel_physical_base: u64, kernel_virtual_base: u64) error{OutOfMemory}!void {
    initial_hhdm_offset = hhdm_offset;
    initial_kernel_physical_base = kernel_physical_base;
    initial_kernel_virtual_base = kernel_virtual_base;

    const pml4_table_address = try pmm.allocate(TABLE_SIZE);
    const pml4_table: [*]volatile u64 = @ptrFromInt(hhdm_offset + pml4_table_address);

    // Initialize the PML4 table with zeroes to make sure the present bit isn't set anywhere
    @memset(pml4_table[0..TABLE_ENTRIES], 0);

    // We get the address of our linker-defined symbols because the values themselves will be whatever's defined in the
    // beginning (or the end) of the section, while the addresses will be what we actually defined in the linker script.

    // Similarly, those addresses will be the virtual addresses to where the sections will be mapped. We then use Limine's
    // Kernel Address Feature to get the physical address of each of those sections.

    serial.writeString(serial.COM1, "Paging: Mapping kernel\n");
    try map(pml4_table, getAlignedKernelAddress(@intFromPtr(&TEXT_START)), @bitCast(@intFromPtr(&TEXT_START)), 3);
    try map(pml4_table, getAlignedKernelAddress(@intFromPtr(&TEXT_END)), @bitCast(@intFromPtr(&TEXT_END)), 3);
    try map(pml4_table, getAlignedKernelAddress(@intFromPtr(&RODATA_START)), @bitCast(@intFromPtr(&RODATA_START)), 3);
    try map(pml4_table, getAlignedKernelAddress(@intFromPtr(&RODATA_END)), @bitCast(@intFromPtr(&RODATA_END)), 3);
    try map(pml4_table, getAlignedKernelAddress(@intFromPtr(&DATA_START)), @bitCast(@intFromPtr(&DATA_START)), 3);
    try map(pml4_table, getAlignedKernelAddress(@intFromPtr(&DATA_END)), @bitCast(@intFromPtr(&DATA_END)), 3);

    serial.writeString(serial.COM1, "Paging: Mapping first 4 GiB\n");
    var address: u64 = 0;
    while (address < 4 * 1024 * 1024 * 1024) : (address += pmm.PAGE_SIZE) {
        try map(pml4_table, address, @bitCast(hhdm_offset + address), 3);
    }
}

fn map(pml4_table: [*]volatile u64, physical_address: u64, virtual_address: VirtualAddress, flags: u64) error{OutOfMemory}!void {
    // serial.debugPrint(serial.COM1, "{X} {any}\n", .{ physical_address, physical_address >= 4 * 1024 * 1024 * 1024 }) catch unreachable;
    //0x30000000
    const pdpr_entries = try getEntryOrAllocate(virtual_address.pml4_index, pml4_table, flags);
    const pd_entries = try getEntryOrAllocate(virtual_address.pdpr_index, pdpr_entries, flags);
    const pt_entries = try getEntryOrAllocate(virtual_address.pd_index, pd_entries, flags);

    pt_entries[virtual_address.pt_index] = physical_address | flags;
}

fn getEntryOrAllocate(index: u64, table: [*]volatile u64, flags: u64) error{OutOfMemory}![*]volatile u64 {
    const entry = table[index];

    if (entry & 1 == 0) {
        // Present flag is missing, so we allocate a new entry
        const new_entry_address = try pmm.allocate(TABLE_SIZE);
        const new_entry: [*]volatile u64 = @ptrFromInt(initial_hhdm_offset + new_entry_address);

        // Initialize the new entry with zeroes to make sure the present bit isn't set anywhere
        @memset(new_entry[0..TABLE_ENTRIES], 0);

        table[index] = new_entry_address | flags;

        return new_entry;
    }

    // 0x000FFFFFFFFFF000 = Gets the physical address (masking off the flags)
    // huh??!! that can't possibly be the solution, right????
    return @ptrFromInt(initial_hhdm_offset + (entry & 0xFFFFFFFFFFFFFFF0));
}

inline fn getAlignedKernelAddress(virtual_address: u64) u64 {
    const address = initial_kernel_physical_base + (virtual_address - initial_kernel_virtual_base);
    return if (address % TABLE_SIZE != 0) address + TABLE_SIZE - (address % TABLE_SIZE) else address;
}
