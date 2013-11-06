module sparky

import spark
import spark.Spark

function main = |args| {

  let conf = map[
    ["extends", "spark.Route"],
    ["implements", map[
      ["handle", |this, request, response| {
        return args: get(0)
      }]
    ]]
  ]
  
  let fabric = AdapterFabric()
  let routeMaker = fabric: maker(conf)
  let route = routeMaker: newInstance("/")
 
  get(route)
}

