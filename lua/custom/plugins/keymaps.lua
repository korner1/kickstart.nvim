-- Custom keymaps

vim.keymap.set('n', '<leader>qq', '<Cmd>confirm qall<CR>', {
	desc = 'Quit Neovim',
	silent = true,
})

vim.keymap.set('n', '<leader>td', function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
end, { desc = '[T]oggle [D]iagnostics (buffer)' })

vim.keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', {
	desc = 'Shrink window width',
	silent = true,
})

vim.keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', {
	desc = 'Grow window width',
	silent = true,
})

local telescope_builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>b', telescope_builtin.buffers, {
	desc = 'Find open [B]uffers',
})

vim.keymap.set('n', '<leader>sb', function()
	telescope_builtin.live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end, {
	desc = '[S]earch open [B]uffers',
})
