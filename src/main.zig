const std = @import("std");

pub fn main() !void {
  var nums = [_] u8 { 1, 2, 3, 4, 5};
  quicksort(&nums);

  std.debug.print("Nums: {any}\n", .{nums});
}

fn quicksort(nums: []u8) void {
  for (nums) |*n| {
    n.* *= 2;
  }
}
