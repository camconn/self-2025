const std = @import("std");

pub fn main() !void {
    const num = try read_num();
    //const num = read_num() catch 5678;
    std.debug.print("read number: {d}\n", .{num});
}

fn read_num() !i32 {
    const cwd = std.fs.cwd();
    var file = try cwd.openFile("num.txt", .{ .mode = .read_only });
    defer file.close();

    var buf: [64]u8 = [_]u8{0} ** 64;
    const n_read = try file.read(&buf);
    const n = try std.fmt.parseInt(i32, buf[0..n_read], 10);
    return n;
}
