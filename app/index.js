'use strict';

import Elm from './Main';

let container = document.getElementById('container');
var counter = Elm.Main.embed(container, { path: '/' });

window.onpopstate = (event) => {
  counter.ports.path.send(window.location.pathname);
};

counter.ports.pushPath.subscribe((path) => {
  console.log("pushPath: " + path);
  window.history.pushState({}, "", path);
  console.log("pathname: " + window.location.pathname);
  counter.ports.path.send(window.location.pathname);
});
