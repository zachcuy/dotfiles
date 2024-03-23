-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.tabstop = 4 -- Sets the number of spaces that a tab is represented by
vim.opt.shiftwidth = 4 -- Sets the width for autoindents
vim.opt.expandtab = true -- Converts tabs to spaces

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
    },
  },
}
