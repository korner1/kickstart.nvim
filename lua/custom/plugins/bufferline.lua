-- Show open buffers in Neovim's tabline.
-- https://github.com/akinsho/bufferline.nvim

vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }

require('bufferline').setup {
  options = {
    mode = 'buffers',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'thin',
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true,
      },
    },
  },
}

vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
