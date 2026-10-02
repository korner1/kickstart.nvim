-- Custom keymaps

vim.keymap.set('n', '<leader>qq', '<Cmd>confirm qall<CR>', {
	desc = 'Quit Neovim',
	silent = true,
})
