return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,       -- charge le thème au démarrage
    priority = 1000,    -- s'assure que le thème se charge avant les autres plugins
    config = function()
      -- Applique le thème Dracula
      vim.cmd.colorscheme "dracula"

      -- Facultatif : garder le fond du terminal intact
      vim.cmd([[hi Normal guibg=NONE]])
    end,
  },

--     "hachy/eva01.vim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       -- Applique le thème Eva-01
--       vim.cmd.colorscheme "eva01"
--     end,
}

--   "catppuccin/nvim", 
--   name = "catppuccin", 
--   priority = 1000, 
--   config = function ()
--     require("catppuccin").setup()
--     vim.cmd.colorscheme "catppuccin-mocha" --catppuccin-frappe" --"tokyonight" "catppuccin" -- catppuccin-latte, catppuccin-macchiato 
--   end,
--   }
