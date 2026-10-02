-- File explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

require('neo-tree').setup {
  enable_git_status = true,
  source_selector = {
    winbar = true,
    sources = {
      { source = 'filesystem', display_name = 'Files' },
      { source = 'git_status', display_name = 'Git' },
    },
  },
  default_component_configs = {
    git_status = {
      symbols = {
        added = '+',
        modified = '~',
        deleted = '-',
        renamed = 'R',
        untracked = '?',
        ignored = '!',
        unstaged = 'U',
        staged = 'S',
        conflict = 'C',
      },
    },
  },
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree', silent = true })
vim.keymap.set('n', '<leader>gs', '<Cmd>Neotree git_status<CR>', { desc = 'Neo-tree Git status', silent = true })
