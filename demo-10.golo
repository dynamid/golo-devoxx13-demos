module templates.webapp

import java.lang
import java.io
import java.net.InetSocketAddress
import com.sun.net.httpserver
import com.sun.net.httpserver.HttpServer

# A beautiful Golo template
local function index_template = -> """
<%@params posts %>
<!DOCTYPE html>
<html>
  <head>
    <title>Golo Chat</title>
  </head>
  <body>
  <form action="/" method="post">
    <input type="text" name="msg">
    <input type="submit" value="Send">
  </form>
  <div>
    <h3>Last posts</h3>
    <% foreach post in posts { %>
      <div>
        <%= post %>
      </div>
    <% } %>
  </div>
  </body>
</html>
"""

function main = |args| {
  
  # Model
  let posts = java.util.concurrent.ConcurrentLinkedDeque()

  # Server
  let server = HttpServer.create(InetSocketAddress("localhost", 8081), 0)

  # Get a template function
  let index_tpl = TemplateEngine(): compile(index_template())

  # "Dependency injection"
  let index = ^index: bindTo(posts): bindTo(index_tpl)

  # Server start
  server: createContext("/", handler(index))
  server: start()
  println(">>> http://localhost:8081/")
}

# HTTP requests on /
local function index = |posts, template, exchange| {
  if exchange: getRequestMethod() == "POST" {
    extract_post(exchange, posts)
    redirect(exchange, "/")
  } else {
    respond(exchange, template(posts))
  }
}

local function respond = |exchange, body| {
  exchange: getResponseHeaders(): set("Content-Type", "text/html")
  exchange: sendResponseHeaders(200, body: length())
  exchange: getResponseBody(): write(body: getBytes())
  exchange: close()
}

local function redirect = |exchange, to| {
  exchange: getResponseHeaders(): set("Location", to)
  exchange: sendResponseHeaders(303, 0)
  exchange: close()
}

local function handler = |func| -> func: to(HttpHandler.class)

# This is leaky and works with just 1 POST parameter...
local function extract_post = |exchange, posts| {
  let reader = BufferedReader(InputStreamReader(exchange: getRequestBody()))
  var line = reader: readLine()
  while line isnt null {
    if line: startsWith("msg=") {
      posts: add(java.net.URLDecoder.decode(line: substring(4), "UTF-8"))
    }
    line = reader: readLine()
  }
  reader: close()
}

