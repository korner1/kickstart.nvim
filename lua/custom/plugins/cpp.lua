-- C and C++ language support

-- nvim-lspconfig is loaded by init.lua before custom plugin modules.
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--completion-style=detailed',
    '--function-arg-placeholders=1',
  },
})
vim.lsp.enable 'clangd'

-- Display clangd's parameter names and deduced types inline by default.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-cpp-inlay-hints', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.name == 'clangd' and client:supports_method('textDocument/inlayHint', event.buf) then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
  end,
})

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
