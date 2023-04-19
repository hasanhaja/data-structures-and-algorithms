const std = @import("std");

pub fn main() !void {
    var nums = [_]u8{ 10, 3, 2, 1, 9 };
    std.debug.print("Nums: {any}\n", .{nums});
    quicksort(&nums, 0, nums.len - 1);
    std.debug.print("Nums: {any}\n", .{nums});
}

fn quicksort(nums: []u8, low: usize, high: usize) void {
    if (low < high) {
        var p = parition(nums, low, high);
        std.debug.print("Partition: {d}\n", .{p});
        if (p == 0) {
            quicksort(nums, p + 1, high);
        } else if (p == (nums.len - 1)) {
            quicksort(nums, low, p - 1);
        } else {
            quicksort(nums, low, p - 1);
            quicksort(nums, p + 1, high);
        }
    }
}

fn parition(nums: []u8, low: usize, high: usize) usize {
    // Picking the last element of the slice
    const pivot = nums[high];

    // Index of element less than and closest to pivot
    var i: usize = undefined;

    for (nums[low..high]) |*n, j| {
        if (n.* <= pivot) {
            // it needs to be set to 0 on first match
            // after first match, i  == low
            if (i > high) {
                i = low;
                continue;
            }

            i += 1;

            std.mem.swap(u8, &nums[i], &nums[j]);
        }
    }

    if (i > high) {
        std.mem.swap(u8, &nums[low], &nums[high]);
        return low;
    } else {
        std.mem.swap(u8, &nums[i + 1], &nums[high]);
        return i + 1;
    }
}

// This is the same as std.mem.swap
// fn swap(a: *u8, b: *u8) void {
//     const temp = a.*;
//     a.* = b.*;
//     b.* = temp;
// }
