module call.java

import java.util.LinkedList

function main = |args| {

  let list = LinkedList()

  list: add(1)
  list: add(2)
  list: add(3)
  println(list)

  foreach i in list {
    if (i % 2) == 1 {
      println("> " + i)
    }
  }
}
