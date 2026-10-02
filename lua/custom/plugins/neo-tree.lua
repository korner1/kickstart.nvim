-- File explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = 'Neo-tree reveal', silent = true })
