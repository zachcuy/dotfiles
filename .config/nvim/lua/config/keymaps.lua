local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- clipboard shit
vim.opt.clipboard = "unnamedplus"
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set({ "n", "v" }, "<C-c>", [["+y]])

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Close buffer without closing window
keymap.set("n", "<C-w>q", ":new<BAR>bd#<CR>", opts)
-- keymap.set("n", "<C-w><C-q>", ":new<BAR>bd#<CR>", opts)

-- no more tab
keymap.del("i", "<Tab>", opts)

-- move up/down work on wrapped lines of text
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- re-center cursor after jumps up/down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- re-center cursor after search movements up/down
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- map p (lower) to P (upper) in visual mode to not stomp on register
keymap.set("v", "p", "P")
keymap.set("v", "P", "p")
