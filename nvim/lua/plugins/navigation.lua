local icn = require 'ui.icons'

return {
  -- https://github.com/ibhagwan/fzf-lua
  {
    'ibhagwan/fzf-lua',
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<CR>', { desc = '[F]ind [F]iles' } },
      { '<leader>fo', '<cmd>FzfLua oldfiles<CR>', { desc = '[R]ecent [B]uffers' } },
      { '<leader>fa', '<cmd>FzfLua autocmds<cr>', { desc = '[F]ind Neovim [A]uto-commands' } },
      { '<leader>fw', '<cmd>FzfLua live_grep<CR>', { desc = '[F]ind [W]ord' } },
      { '<leader>fc', '<cmd>FzfLua command_history<cr>', { desc = '[F]ind [C]ommands' } },
      { '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = '[F]ind [B]uffers' } },
      { '<leader>fn', '<cmd>FzfLua commands<cr>', { desc = '[F]ind Neovim [C]ommands' } },
      { '<leader>fg', '<cmd>FzfLua git_files<cr>', { desc = '[F]ind [G]it Files' } },
      { '<leader>glg', '<cmd>FzfLua git_commits<cr>', { desc = '[G]it [L]og Graph' } },
      { '<leader>gst', '<cmd>FzfLua git_status<cr>', { desc = '[G]it [St]atus' } },
      { '<leader>gsw', '<cmd>FzfLua git_branches<cr>', { desc = '[G]it [S]witch' } },
    },
    opts = {
      fzf_opts = {},
      files = {
        header = 'fd --type f',
        winopts = {
          title = table.concat { ' ', icn.search, ' files ' },
          title_flags = false,
        },
      },
      oldfiles = {
        header = ':FzfLua oldfiles',
        winopts = {
          title = table.concat { ' ', icn.recent, ' recent files ' },
          title_flags = false,
        },
      },
      autocmds = {
        header = ':autocmd',
        winopts = {
          title = table.concat { ' ', icn.warn, ' event triggers ' },
          title_flags = false,
        },
      },
      grep = {
        header = 'rg --vimgrep',
        winopts = {
          title = table.concat { ' ', icn.fuzzy, ' fuzzy search' },
          title_flags = false,
        },
      },
      command_history = {
        header = ':history',
        winopts = {
          title = table.concat { ' ', icn.cmd_hist, ' command history ' },
          title_flags = false,
        },
      },
      buffers = {
        header = ':ls',
        winopts = {
          title = table.concat { ' ', icn.file, ' buffers ' },
          title_flags = false,
        },
      },
      commands = {
        header = ':command',
        winopts = {
          title = table.concat { ' ', icn.vim, ' commands ' },
          title_flags = false,
        },
      },
      git = {
        files = {
          header = 'git ls-files',
          winopts = {
            title = table.concat { ' ', icn.git, ' ', icn.file, ' files (git) ' },
          },
        },
        branches = {
          header = 'git switch',
          winopts = {
            title = table.concat { ' ', icn.branch, ' branches ' },
          },
        },
        status = {
          header = 'git status',
          winopts = {
            title = table.concat { ' ', icn.status, ' git status ' },
          },
        },
        commits = {
          header = 'git log --oneline',
          winopts = {
            title = table.concat { ' ', icn.log, '  git commits ' },
          },
        },
      },
    },
  },

  -- https://github.com/christoomey/vim-tmux-navigator
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<c-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'switch window left' } },
      { '<c-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'switch window down' } },
      { '<c-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'switch window up' } },
      { '<c-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'switch window right' } },
      { '<c-\\>', '<cmd>TmuxNavigatePrevious<CR>', { desc = 'switch last window' } },
    },
  },

  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    opts = {
      hijack_cursor = true,
      disable_netrw = true,
      sync_root_with_cwd = true,
      view = { preserve_window_proportions = true },

      renderer = {
        root_folder_label = false,
        special_files = { 'README.md' },
        highlight_git = true,
        highlight_diagnostics = true,
        highlight_modified = 'icon',

        indent_markers = {
          enable = true,
          icons = {
            edge = '┊',
            item = '┊',
          },
        },

        icons = {
          modified_placement = 'signcolumn',
          diagnostics_placement = 'before',
          glyphs = {
            modified = icn.modified,
            folder = {
              default = '󰉖',
              empty = '󱧹',
              empty_open = '󰷏',
              open = '󰷏',
              symlink = '󱉆',
            },
            git = {
              renamed = '󰑙',
              staged = '+',
              unmerged = '!',
              unstaged = '~',
              untracked = '?',
              ignored = '',
            },
          },
        },
      },

      update_focused_file = { enable = true },

      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = icn.hint,
          info = icn.info,
          warning = icn.warn,
          error = icn.error,
        },
      },

      modified = { enable = true },
      filters = { git_ignored = false },
      live_filter = { prefix = ' ' },
      help = { sort_by = 'desc' },
    },
  },
}
