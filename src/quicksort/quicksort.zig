const std = @import("std");

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