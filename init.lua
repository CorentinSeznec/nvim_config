vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard="unnamed,unnamedplus"

vim.keymap.set('n', '<leader>o', ':put _<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<leader>O', ':put! _<CR>', { noremap = true, silent = true }) 


vim.wo.number = true 
vim.wo.relativenumber = true



require("config.lazy")



vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "#808080"})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "#808080"})
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"})
