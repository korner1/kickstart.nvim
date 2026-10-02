-- Display CSV files as aligned tables.
-- https://github.com/hat0uma/csvview.nvim

vim.pack.add { 'https://github.com/hat0uma/csvview.nvim' }

require('csvview').setup {}

vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('custom-csvview', { clear = true }),
  pattern = '*.csv',
  command = 'CsvViewEnable',
})
