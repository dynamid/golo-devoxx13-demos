module augmentations

import java.util.LinkedList

augment java.util.List {
  
  function odds = |this| {
    let result = LinkedList()
    foreach (i in this) {
      if (i % 2) == 1 {
        result: add(i)
      }
    }
    return result
  }
}

function main = |args| {
  let list = LinkedList()
  list: add(1)
  list: add(2)
  list: add(3)
  println(list: odds())
}




