"use strict";

// Include stylesheets here. Import new scss stylesheets into app.scss
// if you wish to keep this file clean.

require("ace-css/css/ace.css");
require("./styles/app.scss");

// Require index.html so it gets copied to dist

require("./index.html");

// Elm initialization

var Elm = require("./Main.elm");
var mountNode = document.getElementById("main");

var app = Elm.Main.embed(mountNode, {
  nodeEnv: NODE_ENV,
  apiUrl: API_URL
});
