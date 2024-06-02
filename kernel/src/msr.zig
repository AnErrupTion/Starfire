pub fn get(reg: u32) u64 {
    var low: u64 = 0;
    var high: u64 = 0;

    asm volatile ("rdmsr"
        : [_] "={edx}" (high),
          [_] "={eax}" (low),
        : [_] "{ecx}" (reg),
    );

    return (high << 32) | low;
}

pub fn set(reg: u32, value: u64) void {
    asm volatile ("wrmsr"
        :
        : [_] "{ecx}" (reg),
          [_] "{edx}" (value >> 32),
          [_] "{eax}" (value),
    );
}
