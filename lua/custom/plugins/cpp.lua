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
