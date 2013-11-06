module fetch.url

function main = |args| {
  let page = "https://plus.google.com"
  let html = page: toURL(): getContent(): readFully()
  println(html)
}

augment java.lang.String {

  function toURL = |this| -> java.net.URL(this)
}

augment java.io.InputStream {

  function readFully = |this| {
    let streamReader = java.io.InputStreamReader(this)
    let reader = java.io.BufferedReader(streamReader)
    let buffer = java.lang.StringBuilder()
    var line = 0
    while line isnt null {
      line = reader: readLine()
      buffer: append(line orIfNull "")
    }
    reader: close()
    return buffer: toString()
  }
}
