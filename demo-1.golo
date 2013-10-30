# Because everything has a start...
module hello.devoxx.world

function main = |args| {

  let greetings = "Hello Devoxx!"
  output(greetings)

  var x = 1
  x = x * 10
  output(x)
}

local function output = |what| -> println(">>> " + what)
