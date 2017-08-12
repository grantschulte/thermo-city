var jsonServer = require("json-server");

// Returns an Express server
var server = jsonServer.create();

// Set default middlewares (logger, static, cors and no-cache)
server.use(jsonServer.defaults());

var router = jsonServer.router("./db.json");
server.use(router)

console.log("JSON Server: Listening on port 5000");
server.listen(5000);
