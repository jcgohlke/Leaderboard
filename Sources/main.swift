import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectRequestLogger
import SQLiteStORM

let connect = SQLiteConnect("./scoresdb")
let scores = Score(connect)
scores.setup()

let server = HTTPServer()

let logger = RequestLogger()
server.setRequestFilters([(logger, .high)])
server.setResponseFilters([(logger, .low)])

var routes = Routes()

routes.add(method: .get, uri: "/", handler: {
  request, response in
  response.setHeader(.contentType, value: "text/html")
  response.appendBody(string: "<html><head><title>Hello, World!</title></head><body>Hello, World!</body></html>")
  response.completed()
})

routes.add(method: .post, uri: "api/v1/save", handler: processSaveScore)

server.addRoutes(routes)

server.serverPort = 8181

do {
  try server.start()
} catch PerfectError.networkError(let error, let msg)
{
  print("Network error thrown: \(error) \(msg)")
}
