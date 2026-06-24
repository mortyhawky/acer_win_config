vim.opt.background           = dark
vim.cmd.colorscheme          ('habamax')

vim.opt.number               = true
vim.opt.relativenumber       = true

vim.opt.tabstop              = 4
vim.opt.expandtab            = true

vim.opt.cursorline           = true
vim.opt.cursorcolumn         = true


vim.g.mapleader			     = " "
vim.keymap.set	( "n",       "<leader>ex", ":Explore<CR>" )
vim.keymap.set	( {"n","i"}, "<C-s>",      "<Esc>:nohls<CR>:write<CR>"   )
vim.keymap.set	( "n",       "<leader>bn", ":bn<CR>" )
vim.keymap.set	( "n",       "<leader>bp", ":bp<CR>" )

