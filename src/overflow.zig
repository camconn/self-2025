const std = @import("std");

pub fn main() !void {
    std.debug.print("sum     of 1...10   is {d}\n", .{sum(10)});
    std.debug.print("product of 1...10   is {d}\n", .{product(10)});
    std.debug.print("sum     of 1...1000 is {d}\n", .{sum(1000)});
    std.debug.print("product of 1...1000 is {d}\n", .{product(1000)});
}

fn sum(n: usize) i64 {
    var s: i64 = 0;
    for (1..n) |i| {
        s += @intCast(i);
    }
    return s;
}

fn product(n: usize) i64 {
    var p: i64 = 1;
    for (1..n) |i| {
        p *= @intCast(i);
    }
    return p;
}
