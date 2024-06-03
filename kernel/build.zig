const std = @import("std");

pub fn build(b: *std.Build) void {
    var target: std.zig.CrossTarget = .{
        .cpu_arch = .x86_64,
        .os_tag = .freestanding,
        .abi = .none,
    };

    // Those CPU features require additional initialization, so we disable them
    const Features = std.Target.x86.Feature;
    target.cpu_features_sub.addFeature(@intFromEnum(Features.mmx));
    target.cpu_features_sub.addFeature(@intFromEnum(Features.sse));
    target.cpu_features_sub.addFeature(@intFromEnum(Features.sse2));
    target.cpu_features_sub.addFeature(@intFromEnum(Features.avx));
    target.cpu_features_sub.addFeature(@intFromEnum(Features.avx2));
    target.cpu_features_add.addFeature(@intFromEnum(Features.soft_float));

    const optimize = b.standardOptimizeOption(.{});
    const limine = b.dependency("limine", .{});
    const kernel = b.addExecutable(.{
        .name = "Starfire",
        .root_source_file = b.path("src/main.zig"),
        .target = b.resolveTargetQuery(target),
        .optimize = optimize,
        .code_model = .kernel,
        .pic = true,
    });

    kernel.root_module.addImport("limine", limine.module("limine"));
    kernel.setLinkerScriptPath(b.path("linker.ld"));
    kernel.addAssemblyFile(b.path("src/asm/idt.S"));

    // Disable LTO. This prevents issues with limine requests
    kernel.want_lto = false;

    b.installArtifact(kernel);

    const make_iso_step = b.step("make-iso", "Create a bootable ISO image");
    make_iso_step.makeFn = makeIso;
    make_iso_step.dependOn(b.getInstallStep());

    const run_qemu_step = b.step("run-qemu", "Run the operating system under QEMU");
    run_qemu_step.makeFn = runQemu;
    run_qemu_step.dependOn(make_iso_step);

    const run_bochs_step = b.step("run-bochs", "Run the operating system under Bochs");
    run_bochs_step.makeFn = runBochs;
    run_bochs_step.dependOn(make_iso_step);
}

fn makeIso(self: *std.Build.Step, progress: std.Progress.Node) !void {
    _ = progress;

    const current_dir = std.fs.cwd();
    current_dir.makePath("iso_root/boot/limine") catch {};
    current_dir.makePath("iso_root/EFI/BOOT") catch {};

    var isoEfiBootDirectory = try current_dir.openDir("iso_root/EFI/BOOT", .{});
    defer isoEfiBootDirectory.close();

    var isoBootDirectory = try current_dir.openDir("iso_root/boot", .{});
    defer isoBootDirectory.close();

    var isoLimineDirectory = try current_dir.openDir("iso_root/boot/limine", .{});
    defer isoLimineDirectory.close();

    try current_dir.copyFile("limine/BOOTX64.EFI", isoEfiBootDirectory, "BOOTX64.EFI", .{});
    try current_dir.copyFile("zig-out/bin/Starfire", isoBootDirectory, "Starfire", .{});
    try current_dir.copyFile("limine/limine-uefi-cd.bin", isoLimineDirectory, "limine-uefi-cd.bin", .{});
    try current_dir.copyFile("limine/limine-bios-cd.bin", isoLimineDirectory, "limine-bios-cd.bin", .{});
    try current_dir.copyFile("limine/limine-bios.sys", isoLimineDirectory, "limine-bios.sys", .{});
    try current_dir.copyFile("limine/limine.cfg", isoLimineDirectory, "limine.cfg", .{});

    const xorriso_argv = [_][]const u8{
        "xorriso",
        "-as",
        "mkisofs",
        "-b",
        "boot/limine/limine-bios-cd.bin",
        "-no-emul-boot",
        "-boot-load-size",
        "4",
        "-boot-info-table",
        "--efi-boot",
        "boot/limine/limine-uefi-cd.bin",
        "-efi-boot-part",
        "--efi-boot-image",
        "--protective-msdos-label",
        "iso_root",
        "-o",
        "Starfire.iso",
    };

    _ = try self.evalChildProcess(&xorriso_argv);

    const limine_bios_deploy_argv = [_][]const u8{
        "limine/limine",
        "bios-install",
        "Starfire.iso",
    };

    _ = try self.evalChildProcess(&limine_bios_deploy_argv);
}

fn runQemu(self: *std.Build.Step, progress: std.Progress.Node) !void {
    _ = progress;

    // Connect to the VM using netcat, e.g. "nc 127.0.0.1 4444"
    const qemu_argv = [_][]const u8{
        "qemu-system-x86_64",
        "-enable-kvm",
        "-M",
        "q35",
        "-cpu",
        "host",
        "-display",
        "none",
        "-serial",
        "tcp:127.0.0.1:4444,server=on,wait=on",
        "-m",
        "5G",
        "-cdrom",
        "Starfire.iso",
    };

    _ = try self.evalChildProcess(&qemu_argv);
}

fn runBochs(self: *std.Build.Step, progress: std.Progress.Node) !void {
    _ = progress;

    const bochs_argv = [_][]const u8{
        "bochs",
        "-q",
        "-f",
        "./bochsrc",
    };

    _ = try self.evalChildProcess(&bochs_argv);
}
