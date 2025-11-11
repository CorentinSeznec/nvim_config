return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "python" },   -- Installe le parser Python
      highlight = {
        enable = true,                   -- Active la coloration Treesitter
        -- additional_vim_regex_highlighting = false,  -- Désactive la coloration classique
      },
      -- Optional: choisir un dossier différent pour les parsers
      install_dir = vim.fn.stdpath('data') .. '/site',
    })
  end,
}

