require 'config.options'
require 'config.vimkeymap'
require 'config.autocommands'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.which_key',
  require 'plugins.telescope',
  require 'plugins.lazydev_config',
  require 'plugins.lspconfig_config',
  require 'plugins.conform_config',
  require 'plugins.blink_config',
  require 'plugins.colorscheme',
  require 'plugins.todocomments_config',
  require 'plugins.mini_config',
  require 'plugins.treesitter_config',
  require 'plugins.breadcrumbs',
  require 'plugins.mdrenderer_config',

  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  --
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local _markdownToggle = require('render-markdown').toggle
vim.keymap.set('n', '<leader>tr', _markdownToggle, { desc = '[T]oggle [R]ender' })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
