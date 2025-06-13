const std = @import("std");

pub fn main() void {
    const str = "Hello, world! 1234567890";
    std.debug.print("{s}\n", .{str});
    const world = str[7..12];
    std.debug.print("7..12: {s}\n", .{world});

    //for (0..20) |i| {
    for (0..10) |i| {
        std.debug.print("{c} ", .{str[i + 14]});
    }
    std.debug.print("\n", .{});
}
