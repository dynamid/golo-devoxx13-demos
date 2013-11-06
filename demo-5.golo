module data

function main = |args| {
  
  # All literals
  let data = [
    [1, 2, 3],
    tuple[1, 2, 3],
    array[1, 2, 3],
    set[1, 2, 3, 3, 1],
    map[
      ["a", 10],
      ["b", 20]
    ],
    vector[1, 2, 3],
    list[1, 2, 3]
  ]

  # Dump!
  data: each(|element| {
    println(element: toString())
    println("  type: " + element: getClass())
  })

  readln("Next when ready...")

  # Data model
  let contacts = map[
    ["mrbean", map[
      ["email", "bean@gmail.com"],
      ["url", "http://mrbean.com"]
    ]],
    ["larry", map[
      ["email", "larry@iamricherthanyou.com"]
    ]]
  ]

  # MrBean and Larry
  let mrbean = contacts: get("mrbean")
  let larry = contacts: get("larry")
  
  # Illustrates orIfNull
  println(mrbean: get("url") orIfNull "n/a")
  println(larry: get("url") orIfNull "n/a")

  # Querying a non-existent data model because there is no 'address' entry
  println(mrbean: get("address")?: street()?: number() orIfNull "n/a")
}
