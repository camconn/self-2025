const std = @import("std");

pub fn main() !void {
    const fib_10 = fibonacci(10);
    std.debug.print("fibonacci(10) = {d}\n", .{fib_10});
    const fib_20 = fibonacci(20);
    std.debug.print("fibonacci(20) = {d}\n", .{fib_20});
}

pub fn fibonacci(n: i32) i32 {
    std.debug.assert(n >= 0);
    if (n <= 1) {
        return n;
    }

    return fibonacci(n - 1) + fibonacci(n - 2);
}
