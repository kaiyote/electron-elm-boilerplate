'use strict'

import test from 'ava'
import { Application } from 'spectron'
import electronPrebuilt from 'electron-prebuilt'

test.beforeEach(t => {
  t.context.app = new Application({
    path: electronPrebuilt,
    args: ['./main.js']
  })

  return t.context.app.start()
})

test.afterEach(t => {
  return t.context.app.stop()
})

test.serial('app should start and report its title', async t => {
  let app = t.context.app
  await app.client.waitUntilWindowLoaded()
  t.is(1, await app.client.getWindowCount())
  t.is('electron-elm-boilerplate example', await app.webContents.getTitle())
})

test.serial('can navigate between home screen and counter screen', async t => {
  let app = t.context.app
  await app.client.waitUntilWindowLoaded()
  await app.client.click('.container > a')
  await app.client.waitForExist('.backButton')
  await app.client.click('.backButton > a')
  await app.client.waitForExist('.container')
  t.true(await app.client.isVisible('.container > a'))
})

test.serial('the buttons on counter screen function', async t => {
  let app = t.context.app
  await app.client.waitUntilWindowLoaded()
  await app.client.click('.container > a')
  await app.client.waitForExist('.backButton')
  t.is('0', await app.client.getText('.counter'))
  await app.client.click('.btn:first-child')
  t.is('1', await app.client.getText('.counter'))
  await app.client.click('.btn:nth-child(2)')
  t.is('0', await app.client.getText('.counter'))
  await app.client.click('.btn:nth-child(3)')
  t.is('0', await app.client.getText('.counter'))
  await app.client.click('.btn:last-child')
  await app.client.waitUntil(() => app.client.getText('.counter').then((text) => text === '1'))
  await app.client.click('.btn:nth-child(3)')
  t.is('2', await app.client.getText('.counter'))
})
