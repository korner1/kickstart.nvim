-- Review Git changes and file history in a diff view.
-- https://github.com/sindrets/diffview.nvim

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/sindrets/diffview.nvim',
}

require('diffview').setup {}

vim.keymap.set('n', '<leader>gd', '<Cmd>DiffviewOpen<CR>', { desc = 'Open Git diff view', silent = true })
vim.keymap.set('n', '<leader>gD', '<Cmd>DiffviewClose<CR>', { desc = 'Close Git diff view', silent = true })
vim.keymap.set('n', '<leader>gh', '<Cmd>DiffviewFileHistory %<CR>', { desc = 'Git history for current file', silent = true })
vim.keymap.set('n', '<leader>gH', '<Cmd>DiffviewFileHistory<CR>', { desc = 'Git history for repository', silent = true })
