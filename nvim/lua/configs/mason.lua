require('utils.ui').set_base46 'mason'

return {
  PATH = 'skip',

  ui = {
    icons = {
      package_pending = ' ',
      package_installed = ' ',
      package_uninstalled = ' ',
    },
  },

  max_concurrent_installers = 10,

  ensure_installed = {
    'lua-language-server',
    'stylua',
    'html-lsp',
    'css-lsp',
    'prettier',
    'pyre',
  },
}
