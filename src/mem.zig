const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const alloc = gpa.allocator();

    try first_alloc(alloc);
    try leaking_alloc(alloc);
}

fn first_alloc(alloc: std.mem.Allocator) !void {
    const nums = try alloc.alloc(i32, 32);
    defer alloc.free(nums);
    for (0..32) |i| {
        nums[i] = 1;
    }
}

fn leaking_alloc(alloc: std.mem.Allocator) !void {
    const a = try alloc.alloc(i32, 32);
    _ = a; // allows code to compile
    // leak
    //defer alloc.free(a);
}
