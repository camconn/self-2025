const std = @import("std");

const fib = @import("stack.zig");

test "fibonacci" {
    try std.testing.expectEqual(55, fib.fibonacci(10));

    try std.testing.expectEqual(6765, fib.fibonacci(20));
}
