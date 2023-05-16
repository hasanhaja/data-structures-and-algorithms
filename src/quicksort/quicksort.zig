const std = @import("std");
const expect = std.testing.expect;

pub fn quicksort(nums: []u8, low: usize, high: usize) void {
    if (low < high) {
        var p = parition(nums, low, high);
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
    var i: ?usize = null;

    for (nums[low..high]) |*n, j| {
        if (n.* <= pivot) {
            // it needs to be set to 0 on first match
            // after first match, i  == low
            if (i == null) {
                i = low;
                // when swapping i and j, they both need to be with the slice ranges
                std.mem.swap(u8, &nums[i.?], &nums[j + low]);
                continue;
            }

            i = i.? + 1;
            std.mem.swap(u8, &nums[i.?], &nums[j + low]);
        }
    }

    const parition_index = if (i) |index| index + 1 else low;
    std.mem.swap(u8, &nums[parition_index], &nums[high]);
    return parition_index;
}

test "sorts [1]" {
    var nums = [_]u8{1};
    var sorted = [_]u8{1};
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [2, 2, 2, 1, 1, 8, 3, 3, 3]" {
    var nums = [_]u8{ 2, 2, 2, 1, 1, 8, 3, 3, 3 };
    var sorted = [_]u8{ 1, 1, 2, 2, 2, 3, 3, 3, 8 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [2, 0, 2, 1, 1, 8, 3, 0, 3]" {
    var nums = [_]u8{ 2, 0, 2, 1, 1, 8, 3, 0, 3 };
    var sorted = [_]u8{ 0, 0, 1, 1, 2, 2, 3, 3, 8 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [1, 2, 3]" {
    var nums = [_]u8{ 1, 2, 3 };
    var sorted = [_]u8{ 1, 2, 3 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [2, 3, 1]" {
    var nums = [_]u8{ 2, 3, 1 };
    var sorted = [_]u8{ 1, 2, 3 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [3, 9, 6, 14, 29, 5]" {
    var nums = [_]u8{ 3, 9, 6, 14, 29, 5 };
    var sorted = [_]u8{ 3, 5, 6, 9, 14, 29 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [10, 3, 2, 1, 9]" {
    var nums = [_]u8{ 10, 3, 2, 1, 9 };
    var sorted = [_]u8{ 1, 2, 3, 9, 10 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}

test "sorts [11, 10, 3, 2, 1, 9, 12]" {
    var nums = [_]u8{ 11, 10, 3, 2, 1, 9, 12 };
    var sorted = [_]u8{ 1, 2, 3, 9, 10, 11, 12 };
    quicksort(&nums, 0, nums.len - 1);
    try expect(std.mem.eql(u8, &nums, &sorted));
}
