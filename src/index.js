// Import global assets here. These assets will be used throughout
// the app. For instance, I've included all app-specific styles
// via the app.scss manifest, as well as our css helper library.
// I've also included images that aren't imported into components,
// but are being referenced by index.html.

import "ace-css/css/ace.css";
import "styles/app.scss";

// Import Favicons

// import "images/favicon.ico";
// import "images/favicon-16x16.png";
// import "images/favicon-32x32.png";

// Copy index.html to /dist

import "./index.html";

// Import key for development. This key is not in source code.

// import key from "../key";

// function getUserCoords() {
//   let coordsFromStorage = window.localStorage.getItem("thermo-city-coords");
//   let addressFromStorage = window.localStorage.getItem("thermo-city-address");
//
//   if (coordsFromStorage && addressFromStorage) {
//     initElmApp(JSON.parse(coordsFromStorage), addressFromStorage);
//   } else {
//     getLocationAndAddress();
//   }
// }

// function getLocationAndAddress() {
//   navigator.geolocation.getCurrentPosition((position) => {
//     let { latitude, longitude } = position.coords;
//
//     let coordinates = {
//       latitude,
//       longitude
//     };
//
//     fetch(`https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&sensor=false&key=${key}`)
//       .then(res => res.json())
//       .then(data => data.results[0])
//       .then(result => {
//         window.localStorage.setItem("thermo-city-coords", JSON.stringify(coordinates));
//         window.localStorage.setItem("thermo-city-address", result.formatted_address);
//         initElmApp(coordinates, result.formatted_address);
//       })
//       .catch(error => console.log(error));
//
//   }, (error) => {
//     console.log(error)
//   });
// }

function initElmApp(coordinates, address) {
  const Elm = require("./app/Main.elm");
  const mountNode = document.getElementById("main");
  const app = Elm.Main.embed(mountNode, {
    apiUrl: API_URL,
    nodeEnv: NODE_ENV
  });
}

// getUserCoords();
initElmApp();
