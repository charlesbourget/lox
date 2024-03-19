const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "clox",
        .target = target,
        .optimize = optimize,
    });
    exe.linkLibC();
    exe.addCSourceFiles(&.{
        "src/main.c",
        "src/chunk.h",
        "src/chunk.c",
        "src/memory.h",
        "src/memory.c",
        "src/debug.h",
        "src/debug.c",
        "src/value.h",
        "src/value.c",
        "src/vm.c",
        "src/vm.h",
        "src/compiler.c",
        "src/compiler.h",
        "src/scanner.c",
        "src/scanner.h",
        "src/object.h",
        "src/object.c",
        "src/table.c",
        "src/table.h",
    }, &.{ "-pedantic", "-Wall", "-W", "-Wno-missing-field-initializers", "-std=c17" });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run CLox");
    run_step.dependOn(&run_cmd.step);
}
