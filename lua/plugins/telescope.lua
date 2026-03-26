return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { 
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", 
  },
  keys = {
    { "<leader>fb", ":Telescope file_browser<CR>"},
  },
  config = function()
    local telescope = require("telescope")
    local fb_actions = telescope.extensions.file_browser.actions
    telescope.setup({
      defaults = {
        layout_strategy = "flex",
        initial_mode = "normal",
        -- sorting_strategy = "ascending",
      },
      extensions = {
        file_browser = {
          mappings = {
            ["i"] = {
              ["<C-h>"] = fb_actions.goto_home_dir,
              ["<C-b>"] = fb_actions.goto_parent_dir,
            },
            ["n"] = {
              ["h"] = fb_actions.goto_home_dir,
              ["b"] = fb_actions.goto_parent_dir,
              -- ["v"] = fb_actions.select_vertical,
            },
          },
        },
      },
    })

    require("telescope").load_extension "file_browser"
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fp', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    
 end
}
