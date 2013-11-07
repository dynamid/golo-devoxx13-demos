module sparky

import spark
import spark.Spark

function main = |args| {

  # Configuration
  let adaptation = map[
    ["extends", "spark.Route"],
    ["implements", map[
      ["handle", |this, request, response| {
        return args: get(0)
      }]
    ]]
  ]
  
  # Adapter "factory"
  let fabric = AdapterFabric()
  let routeMaker = fabric: maker(adaptation)

  # Make Spark happy
  get(routeMaker: newInstance("/"))
}

