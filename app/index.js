'use strict';

import Elm from './Main';
import Elm2 from './Nested/Main';

let left = document.getElementById('left');
let right = document.getElementById('right');
var logs = document.getElementById('logs');

function appendLog(source, log) {
  let node = document.createElement('div');
  node.style.color = 'red';
  node.innerText = '[' + source + '] ' + log + ', time = ' + Date.now();
  logs.appendChild(node);
}

let elmLeft = Elm.Main.embed(left);
elmLeft.ports.callJSLog.subscribe(appendLog.bind(null, 'Elm.Main'));

let elmRight = Elm2.Nested.Main.embed(right);
elmRight.ports.callJSLog.subscribe(appendLog.bind(null, 'Elm.Nested.Main'));
