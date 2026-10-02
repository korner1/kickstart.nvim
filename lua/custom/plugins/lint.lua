-- Language-specific linting

vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'

lint.linters_by_ft = {
  c = { 'clangtidy' },
  cpp = { 'clangtidy' },
  python = { 'ruff' },
}

local lint_group = vim.api.nvim_create_augroup('custom-lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
  group = lint_group,
  callback = function()
    if vim.bo.modifiable then lint.try_lint() end
  end,
})
