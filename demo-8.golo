module dynobj

function main = |args| {

  let counter = DynamicObject():
    define("value", 0):
    define("incr", |this| {
      this: value(this: value() + 1)
      return this
    })
  
  println(counter: value())
  
  counter: incr(): incr()
  
  println(counter: value())
}
