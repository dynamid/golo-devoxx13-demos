module std.augmentations

import java.util.LinkedList

function main = |args| {
  let list = LinkedList(): append(1, 2, 3, 4, 5, 6)
  let odds = list: filter(|x| -> (x % 2) == 1)
  println(odds)
}

