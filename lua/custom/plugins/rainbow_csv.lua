-- Highlight delimited text columns in alternating colors.
-- https://github.com/mechatroner/rainbow_csv

vim.pack.add { 'https://github.com/mechatroner/rainbow_csv' }

vim.filetype.add {
  extension = {
    csv = 'csv',
    tsv = 'tsv',
  },
}

vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('custom-rainbow-csv', { clear = true }),
  pattern = { '*.csv', '*.tsv' },
  command = 'RainbowDelim',
})
