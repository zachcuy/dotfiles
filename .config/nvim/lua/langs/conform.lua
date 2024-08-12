-- Conform will run multiple formatters sequentially
-- You can customize some of the format options for the filetype (:help conform.format)
-- Conform will run the first available formatter
return {
  {
    "stevearc/conform.nvim",
    opts = {
      require("conform").setup({
        formatters_by_ft = {},
      }),
    },
  },
}
