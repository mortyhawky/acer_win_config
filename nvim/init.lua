vim.opt.background           = dark
vim.cmd.colorscheme          ('habamax')

--vim.opt.number               = true
--vim.opt.relativenumber       = true

vim.opt.tabstop              = 4
vim.opt.shiftwidth           = 4
vim.opt.expandtab            = true

vim.opt.cursorline           = true
vim.opt.cursorcolumn         = true
vim.opt.guicursor:append     ("i:hor20")

vim.g.mapleader			     = " "
vim.keymap.set	( {"n","i"}, "<C-s>",      "<Esc>:nohls<CR>:write<CR>"   )
vim.keymap.set	( "n",       "<leader>ex", ":Explore<CR>" )
vim.keymap.set	( "n",       "<leader>bn", ":bn<CR>" )
vim.keymap.set	( "n",       "<leader>bp", ":bp<CR>" )
vim.keymap.set	( "n",       "<leader>no", ":set nonumber<CR>:set norelativenumber<CR>" )
vim.keymap.set	( "n",       "<leader>nr", ":set number<CR>:set relativenumber<CR>" )

--vim.keymap.set  ( "n",       "<C-h>",      ":echo 'C-h'<CR>"   )

-- Ctrl+h,j are remapped in alacritty to F13 and F14
vim.keymap.set  ( "n",       "<F13>",      ":wincmd h<CR>"   )
vim.keymap.set  ( "n",       "<C-h>",      ":wincmd h<CR>"   )
vim.keymap.set  ( "n",       "<F14>",      ":wincmd j<CR>"   )
vim.keymap.set  ( "n",       "<C-j>",      ":wincmd j<CR>"   )
vim.keymap.set  ( "n",       "<C-k>",      ":wincmd k<CR>"   )
vim.keymap.set  ( "n",       "<C-l>",      ":wincmd l<CR>"   )
