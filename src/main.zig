const std = @import("std");
const quicksort = @import("./quicksort/quicksort.zig").quicksort;

pub fn main() !void {
    var nums = [_]u8{ 11, 10, 3, 2, 1, 9, 12 };
    // var nums = [_]u8{ 10, 3, 2, 1, 9 };
    std.debug.print("Nums: {any}\n", .{nums});
    quicksort(&nums, 0, nums.len - 1);
    std.debug.print("Nums: {any}\n", .{nums});
}
