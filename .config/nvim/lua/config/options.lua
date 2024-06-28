-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable relative line numbers
vim.opt.relativenumber = false

-- Ensure absolute line numbers are enabled
vim.opt.number = true

-- bugged with nvim-cmp (Jun 17, 2024)
vim.o.cursorcolumn = false;
