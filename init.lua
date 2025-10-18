vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard="unnamed,unnamedplus"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<leader>O', 'O<Esc>', { noremap = true, silent = true }) 
vim.keymap.set('n', 'ù', '<CR>', { buffer= true, noremap = true, silent = true }) 
vim.keymap.set('i', 'ù', '<CR>', { noremap = true, silent = true }) 

vim.keymap.set('n', '<A-ù>', '<BS>', { noremap = true, silent = true }) 
vim.keymap.set('i', '<A-ù>', '<BS>', { noremap = true, silent = true }) 

vim.keymap.set('n', '<A-*>', '#', { noremap = true, silent = true })
vim.wo.number = true 
vim.wo.relativenumber = true

vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "#808080"})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "#808080"})
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"})

vim.g.python3_host_prog = "/usr/bin/python3"

require("config.lazy")



