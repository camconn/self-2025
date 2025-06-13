const std = @import("std");

pub fn main() !void {
    std.debug.print("doing work\n", .{});
    try write_and_close("work.txt");
    std.debug.print("done\n", .{});
}

pub fn write_and_close(name: []const u8) !void {
    const cwd = std.fs.cwd();
    var file = try cwd.createFile(name, .{});
    defer file.close();

    const result = try do_work();

    const writer = file.writer();
    try writer.print("{d}\n", .{result});
}

fn do_work() !i32 {
    // do some work
    return 10;
}
