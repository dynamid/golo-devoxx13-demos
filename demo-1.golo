# Because everything has a start...
module hello.devoxx.world

function main = |args| {

  let greetings = "Hello Devoxx!"
  
  var x = 1
  x = x * 10

  output(greetings)
  output(x)
}

local function output = |what| -> println(">>> " + what)
