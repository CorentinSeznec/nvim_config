vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- nécessite xclip pour fonctionner, sudo apt install xclip
-- Sans sudo, c'est pas simple, il faut compiler soi meme mais nécessite
-- des outils installable avec sudo
vim.opt.clipboard="unnamed,unnamedplus"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Open a line in normal mode 
vim.keymap.set('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { noremap = true, silent = true }) 

vim.keymap.set('n', 'ù', '<CR>', { buffer= true, noremap = true, silent = true }) 
vim.keymap.set('i', 'ù', '<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<A-ù>', '<BS>', { noremap = true, silent = true }) 
vim.keymap.set('i', '<A-ù>', '<BS>', { noremap = true, silent = true }) 

 -- Remap (Fn) f1 for ctrl 6 to alternate with alternative buffer
vim.keymap.set('n', '<F1>', '<C-6>')

vim.keymap.set('n', '<A-*>', '#', { noremap = true, silent = true })
vim.wo.number = true 
vim.wo.relativenumber = true

vim.opt.termguicolors = false 
 
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "#808080"})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "#808080"})
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"})

vim.g.python3_host_prog = "/usr/bin/python3"

require("config.lazy")



