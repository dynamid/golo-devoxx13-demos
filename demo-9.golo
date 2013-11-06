module like.go

struct Point = { x, y }

augment like.go.types.Point {

  function moveBy = |this, dx, dy| {
    this: x(this: x() + dx)
    this: y(this: y() + dy)
    return this
  }
}

function main = |args| {
  println(Point(1, 1): moveBy(10, -5))
}
