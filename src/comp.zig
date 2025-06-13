const std = @import("std");

pub fn main() !void {
    @setEvalBranchQuota(100_000);
    const fib_a = comptime fibonacci(10);
    std.debug.print("fibonacci(10) = {d}\n", .{fib_a});
    const fib_b = comptime fibonacci(25);
    std.debug.print("fibonacci(25) = {d}\n", .{fib_b});
}

pub fn fibonacci(n: i32) i32 {
    std.debug.assert(n >= 0);
    if (n <= 1) {
        return n;
    }

    return fibonacci(n - 1) + fibonacci(n - 2);
}
