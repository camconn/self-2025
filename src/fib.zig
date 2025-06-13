const std = @import("std");

pub fn main() !void {
    const fib_a = fibonacci(10);
    std.debug.print("fibonacci(10) = {d}\n", .{fib_a});
    const fib_b = fibonacci(30);
    std.debug.print("fibonacci(30) = {d}\n", .{fib_b});
}

pub fn fibonacci(n: i32) i32 {
    std.debug.assert(n >= 0);
    if (n <= 1) {
        return n;
    }

    return fibonacci(n - 1) + fibonacci(n - 2);
}
