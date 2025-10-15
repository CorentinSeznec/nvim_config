-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add lazy to the path with all path
-- echo nvim_list_runtime_paths()
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}},
  {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate'
  },
  { require("plugins.config_telescope")},
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}
}

local opts = {}

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    plugins, opts
  },
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha" --catppuccin-frappe" --"tokyonight" "catppuccin" -- catppuccin-latte, catppuccin-macchiato 

require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to
  install_dir = vim.fn.stdpath('data') .. '/site'
}

