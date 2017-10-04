// Import global assets here. These assets will be used throughout
// the app. For instance, I've included all app-specific styles
// via the app.scss manifest, as well as our css helper library.
// I've also included images that aren't imported into components,
// but are being referenced by index.html.

import "ace-css/css/ace.css";
import "styles/app.scss";

// Import Favicons

import "images/favicon.ico";
import "images/favicon-16x16.png";
import "images/favicon-32x32.png";
import "images/favicon-96x96.png";
import "images/favicon-128.png";
import "images/favicon-196x196.png";
import "images/apple-touch-icon-57x57.png";
import "images/apple-touch-icon-60x60.png";
import "images/apple-touch-icon-72x72.png";
import "images/apple-touch-icon-76x76.png";
import "images/apple-touch-icon-114x114.png";
import "images/apple-touch-icon-120x120.png";
import "images/apple-touch-icon-144x144.png";
import "images/apple-touch-icon-152x152.png";

// Copy index.html to /dist

import "./index.html";

// Initialize Elm App

const Elm = require("./app/Main.elm");
const mountNode = document.getElementById("main");
const app = Elm.Main.embed(mountNode, {
  apiUrl: API_URL,
  nodeEnv: NODE_ENV
});
