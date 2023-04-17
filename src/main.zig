const std = @import("std");

pub fn main() !void {
    var nums = [_]u8{ 3, 2, 4, 1 };
    std.debug.print("Nums: {any}\n", .{nums});
    quicksort(&nums, 0, 3);
    std.debug.print("Nums: {any}\n", .{nums});
}

fn quicksort(nums: []u8, low: usize, high: usize) void {
    std.debug.print("In quicksort, low = {d}, high = {d}\n", .{ low, high });
    if (low < high) {
        var p = parition(nums, low, high);

        quicksort(nums, low, p - 1);
        quicksort(nums, p + 1, high);
    }
}

fn parition(nums: []u8, low: usize, high: usize) usize {
    // Picking the last element of the slice
    const pivot = nums[high];

    var i = low;

    for (nums[low..high]) |*n| {
        if (n.* <= pivot) {
            i += 1;
        }
    }

    std.mem.swap(u8, &nums[i], &nums[high]);

    return i;
}

// This is the same as std.mem.swap
// fn swap(a: *u8, b: *u8) void {
//     const temp = a.*;
//     a.* = b.*;
//     b.* = temp;
// }
