-- Conform will run multiple formatters sequentially
-- You can customize some of the format options for the filetype (:help conform.format)
-- Conform will run the first available formatter
return {
  {
    "stevearc/conform.nvim",
    opts = {
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          xml = { "xmlformat" },
        },
      }),
    },
  },
}
