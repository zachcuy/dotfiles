local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Titles
keymap({ "n", "v" }, "<Leader>bb", "<Cmd>CBccbox<CR>", opts)
-- Named parts
keymap({ "n", "v" }, "<Leader>bt", "<Cmd>CBllline<CR>", opts)
-- Simple line
keymap("n", "<Leader>bl", "<Cmd>CBline<CR>", opts)
-- Marked comments
keymap({ "n", "v" }, "<Leader>bm", "<Cmd>CBllbox14<CR>", opts)
-- delete:
keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "h", "hpp" },
        callback = function()
          -- Directly setting for C++ files
          vim.bo.commentstring = "// %s"
        end,
      }),
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          vim.opt.formatoptions:remove({ "c", "r", "o" })
        end,
        desc = "Disable New Line Comment",
      }),
    },
  },
  {
    "LudoPinelli/comment-box.nvim",
  },
}
