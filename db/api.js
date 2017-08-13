var jsonServer = require("json-server");
var path = require("path");

// Returns an Express server
var server = jsonServer.create();

// Set default middlewares (logger, static, cors and no-cache)
server.use(jsonServer.defaults());

var router = jsonServer.router(path.join(__dirname, "db.json"));
server.use(router)

console.log("JSON Server: Listening on port 5000");
server.listen(5000);
