import { app, BrowserWindow, Menu, crashReporter, shell } from 'electron'

let menu
let template
let mainWindow = null

crashReporter.start({companyName: 'nop', submitURL: 'http://nop'})

if (process.env.NODE_ENV === 'development') {
  require('electron-debug')()
}

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})

app.on('ready', () => {
  mainWindow = new BrowserWindow({
    show: false,
    width: 1024,
    height: 728
  })

  mainWindow.loadURL(`file://${__dirname}/app/app.html`)

  mainWindow.webContents.on('did-finish-load', () => {
    mainWindow.show()
    mainWindow.focus()
  })

  mainWindow.on('closed', () => {
    mainWindow = null
  })

  if (process.env.NODE_ENV === 'development') {
    mainWindow.openDevTools()
  }

  if (process.platform === 'darwin') {
    template = [{
      label: 'Electron',
      submenu: [{
        label: 'About ElectronReact',
        selector: 'orderFrontStandardAboutPanel:'
      }, {
        type: 'separator'
      }, {
        label: 'Services',
        submenu: []
      }, {
        type: 'separator'
      }, {
        label: 'Hide ElectronReact',
        accelerator: 'Command+H',
        selector: 'hide:'
      }, {
        label: 'Hide Others',
        accelerator: 'Command+Shift+H',
        selector: 'hideOtherApplications:'
      }, {
        label: 'Show All',
        selector: 'unhideAllApplications:'
      }, {
        type: 'separator'
      }, {
        label: 'Quit',
        accelerator: 'Command+Q',
        click: function () {
          app.quit()
        }
      }]
    }, {
      label: 'Edit',
      submenu: [{
        label: 'Undo',
        accelerator: 'Command+Z',
        selector: 'undo:'
      }, {
        label: 'Redo',
        accelerator: 'Shift+Command+Z',
        selector: 'redo:'
      }, {
        type: 'separator'
      }, {
        label: 'Cut',
        accelerator: 'Command+X',
        selector: 'cut:'
      }, {
        label: 'Copy',
        accelerator: 'Command+C',
        selector: 'copy:'
      }, {
        label: 'Paste',
        accelerator: 'Command+V',
        selector: 'paste:'
      }, {
        label: 'Select All',
        accelerator: 'Command+A',
        selector: 'selectAll:'
      }]
    }, {
      label: 'View',
      submenu: (process.env.NODE_ENV === 'development') ? [{
        label: 'Reload',
        accelerator: 'Command+R',
        click: function () {
          mainWindow.restart()
        }
      }, {
        label: 'Toggle Full Screen',
        accelerator: 'Ctrl+Command+F',
        click: function () {
          mainWindow.setFullScreen(!mainWindow.isFullScreen())
        }
      }, {
        label: 'Toggle Developer Tools',
        accelerator: 'Alt+Command+I',
        click: function () {
          mainWindow.toggleDevTools()
        }
      }] : [{
        label: 'Toggle Full Screen',
        accelerator: 'Ctrl+Command+F',
        click: function () {
          mainWindow.setFullScreen(!mainWindow.isFullScreen())
        }
      }]
    }, {
      label: 'Window',
      submenu: [{
        label: 'Minimize',
        accelerator: 'Command+M',
        selector: 'performMiniaturize:'
      }, {
        label: 'Close',
        accelerator: 'Command+W',
        selector: 'performClose:'
      }, {
        type: 'separator'
      }, {
        label: 'Bring All to Front',
        selector: 'arrangeInFront:'
      }]
    }, {
      label: 'Help',
      submenu: [{
        label: 'Learn More',
        click: function () {
          shell.openExternal('http://electron.atom.io')
        }
      }, {
        label: 'Documentation',
        click: function () {
          shell.openExternal('https://github.com/atom/electron/tree/master/docs#readme')
        }
      }, {
        label: 'Community Discussions',
        click: function () {
          shell.openExternal('https://discuss.atom.io/c/electron')
        }
      }, {
        label: 'Search Issues',
        click: function () {
          shell.openExternal('https://github.com/atom/electron/issues')
        }
      }]
    }]

    menu = Menu.buildFromTemplate(template)
    Menu.setApplicationMenu(menu)
  } else {
    template = [{
      label: '&File',
      submenu: [{
        label: '&Open',
        accelerator: 'Ctrl+O'
      }, {
        label: '&Close',
        accelerator: 'Ctrl+W',
        click: function () {
          mainWindow.close()
        }
      }]
    }, {
      label: '&View',
      submenu: (process.env.NODE_ENV === 'development') ? [{
        label: '&Reload',
        accelerator: 'Ctrl+R',
        click: function () {
          mainWindow.restart()
        }
      }, {
        label: 'Toggle &Full Screen',
        accelerator: 'F11',
        click: function () {
          mainWindow.setFullScreen(!mainWindow.isFullScreen())
        }
      }, {
        label: 'Toggle &Developer Tools',
        accelerator: 'Alt+Ctrl+I',
        click: function () {
          mainWindow.toggleDevTools()
        }
      }] : [{
        label: 'Toggle &Full Screen',
        accelerator: 'F11',
        click: function () {
          mainWindow.setFullScreen(!mainWindow.isFullScreen())
        }
      }]
    }, {
      label: 'Help',
      submenu: [{
        label: 'Learn More',
        click: function () {
          shell.openExternal('http://electron.atom.io')
        }
      }, {
        label: 'Documentation',
        click: function () {
          shell.openExternal('https://github.com/atom/electron/tree/master/docs#readme')
        }
      }, {
        label: 'Community Discussions',
        click: function () {
          shell.openExternal('https://discuss.atom.io/c/electron')
        }
      }, {
        label: 'Search Issues',
        click: function () {
          shell.openExternal('https://github.com/atom/electron/issues')
        }
      }]
    }]
    menu = Menu.buildFromTemplate(template)
    mainWindow.setMenu(menu)
  }
})
