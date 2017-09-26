// Import global assets here. These assets will be used throughout
// the app. For instance, I've included all app-specific styles
// via the app.scss manifest, as well as our css helper library.
// I've also included images that aren't imported into components,
// but are being referenced by index.html.

import "ace-css/css/ace.css";
import "styles/app.scss";
// import "styles/climacons.scss"

// Import Favicons

// import "images/favicon.ico";
// import "images/favicon-16x16.png";
// import "images/favicon-32x32.png";

// Copy index.html to /dist

import "./index.html";

function getUserCoords() {
  navigator.geolocation.getCurrentPosition((position) => {
    let { latitude, longitude } = position.coords;

    let coords = {
      latitude,
      longitude
    };

    // Initialize Elm App

    const Elm = require("./app/Main.elm");
    const mountNode = document.getElementById("main");
    const app = Elm.Main.embed(mountNode, {
      apiUrl: API_URL,
      coordinates: coords,
      nodeEnv: NODE_ENV
    });
  }, (error) => {}, { enableHighAccuracy: false });
}

getUserCoords();
