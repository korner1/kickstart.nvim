-- Custom keymaps

vim.keymap.set('n', '<leader>qq', '<Cmd>confirm qall<CR>', {
	desc = 'Quit Neovim',
	silent = true,
})

vim.keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', {
	desc = 'Shrink window width',
	silent = true,
})

vim.keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', {
	desc = 'Grow window width',
	silent = true,
})
