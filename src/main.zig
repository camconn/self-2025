const std = @import("std");

pub fn main() !void {
    // printf debugging to stderr
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // Print to stdout, the correct way to write an application
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Hello, SELF 2025.", .{});
    try bw.flush();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const alloc = gpa.allocator();
    const combined = try concat("Hello, ", "LinuxFest", alloc);
    {
        defer alloc.free(combined);
        try stdout.print("{s}\n\n", .{combined});
    }
}

fn concat(lhs: []const u8, rhs: []const u8, alloc: std.mem.Allocator) ![]u8 {
    const len = lhs.len + rhs.len;
    var out = try alloc.alloc(u8, len + 1);
    errdefer alloc.free(out);
    @memcpy(out[0..lhs.len], lhs[0..]);
    @memcpy(out[lhs.len..len], rhs[0..]);
    out[len] = 0;
    return out;
}
