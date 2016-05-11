# electron-elm-boilerplate

> Live editing development on desktop app

[Electron](http://electron.atom.io/) application boilerplate based on [Elm](http://elm-lang.org/docs) and [Webpack](http://webpack.github.io/docs/), for rapid, statically-typed application development

## IMPORTANT NOTE
- This seed app is currently in active development. The list of dependencies will probably not work for what you want to do with the code that exists here. You have been warned.
- elm-hot-loader does not work at all with Elm v0.17.0. The author is aware, but for now there is nothing I want/know how to do about it. I'm leaving it in since it doesn't hurt anything, but just be aware that hot reloading will not function with elm modules.

## Install

First, install Elm (this project uses Elm v0.17.0+ syntax)
```bash
npm install -g elm
```

Then, clone the repo via git:

```bash
git clone https://github.com/kaiyote/electron-elm-boilerplate.git your-project-name
```

And then install dependencies.

```bash
$ cd your-project-name && npm install
```

This project is configured to require Node 6+. If you don't have that installed, you'll either need to augment the babel setup or upgrade your node.


## Run

Run these two commands __simultaneously__ in different console tabs.

```bash
$ npm run hot-server
$ npm run start-hot
```

or run two servers with one command

```bash
$ npm run dev
```

*Note: requires a node version >= 6 and an npm version >= 3.*


## DevTools

#### Toggle Chrome DevTools

- OS X: <kbd>Cmd</kbd> <kbd>Alt</kbd> <kbd>I</kbd> or <kbd>F12</kbd>
- Linux: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>I</kbd> or <kbd>F12</kbd>
- Windows: <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>I</kbd> or <kbd>F12</kbd>

*See [electron-debug](https://github.com/sindresorhus/electron-debug) for more information.*


## Externals

If you use any 3rd party libraries which can't be built with webpack, you must list them in your `webpack.config.base.js`：

```javascript
externals: [
  // put your node 3rd party libraries which can't be built with webpack here (mysql, mongodb, and so on..)
]
```

You can find those lines in the file.


## Package

```bash
$ npm run package
```

To package apps for all platforms:

```bash
$ npm run package-all
```

#### Options

- --name, -n: Application name (default: ElectronReact)
- --version, -v: Electron version (default: latest version)
- --asar, -a: [asar](https://github.com/atom/asar) support (default: false)
- --icon, -i: Application icon
- --all: pack for all platforms

Use `electron-packager` to pack your app with `--all` options for darwin (osx), linux and win32 (windows) platform. After build, you will find them in `release` folder. Otherwise, you will only find one for your os.

`test`, `release` folder and devDependencies in `package.json` will be ignored by default.

#### Default Ignore modules

We add some module's `peerDependencies` to ignore option as default for application size reduction.

- `babel-core` is required by `babel-loader` and its size is ~19 MB
- `node-libs-browser` is required by `webpack` and its size is ~3MB.

> **Note:** If you want to use any above modules in runtime, for example: `require('babel/register')`, you should move them from `devDependencies` to `dependencies`.

#### Building windows apps from non-windows platforms

Please checkout [Building windows apps from non-windows platforms](https://github.com/maxogden/electron-packager#building-windows-apps-from-non-windows-platforms).


## Maintainers

- [Tim Huddle](https://github.com/kaiyote)
- Based on [Electron React Boilerplate](https://github.com/chentsulin/electron-react-boilerplate)


## License
MIT © [Tim Huddle](https://github.com/kaiyote)
