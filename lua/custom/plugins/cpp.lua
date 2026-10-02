-- C and C++ language support

-- nvim-lspconfig is loaded by init.lua before custom plugin modules.
vim.lsp.config('clangd', {
  cmd = { 'clangd', '--background-index' },
})
vim.lsp.enable 'clangd'

-- Run clang-tidy separately so its diagnostics are not duplicated by clangd.
vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'
lint.linters_by_ft.c = { 'clangtidy' }
lint.linters_by_ft.cpp = { 'clangtidy' }

local lint_group = vim.api.nvim_create_augroup('custom-cpp-lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
  group = lint_group,
  pattern = { '*.c', '*.cc', '*.cpp', '*.cxx', '*.h', '*.hh', '*.hpp', '*.hxx' },
  callback = function()
    if vim.bo.modifiable then lint.try_lint 'clangtidy' end
  end,
})
