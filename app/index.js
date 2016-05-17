'use strict'

import Elm from './Main'

let container = document.getElementById('container')
var counter = Elm.Main.embed(container, { path: '/', swap: false })

window.onpopstate = (event) => {
  counter.ports.path.send(window.location.hash.split('#')[1])
}

counter.ports.pushPath.subscribe((path) => {
  window.history.pushState({}, '', window.location.pathname + '#' + path)
  counter.ports.path.send(window.location.hash.split('#')[1])
})

counter.ports.delay.subscribe((delay) => {
  setTimeout(() => {
    counter.ports.postDelay.send(null)
  }, delay)
})
