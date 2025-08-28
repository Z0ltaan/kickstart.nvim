-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
--
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set indents and no comment on new line',
  callback = function()
    vim.opt.formatoptions:remove { 'r', 'o' }
    vim.o.shiftwidth = 2
    vim.o.expandtab = true
    vim.o.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  -- group = 'mine-group',
  pattern = 'help',
  command = 'wincmd L',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
