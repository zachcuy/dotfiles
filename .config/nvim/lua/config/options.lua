-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- tabbing shit
vim.opt.tabstop = 4 -- Sets the number of spaces that a tab is represented by
vim.opt.shiftwidth = 4 -- Sets the width for autoindents
vim.opt.softtabstop = 4 -- Sets the width for a TAB (the actual tab character, not spaces)
vim.opt.expandtab = true -- Converts tabs to spaces

-- host stuff
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0

-- Disable relative line numbers
vim.opt.relativenumber = false

-- Ensure absolute line numbers are enabled
vim.opt.number = true

-- bugged with nvim-cmp (Jun 17, 2024)
vim.o.cursorcolumn = false
