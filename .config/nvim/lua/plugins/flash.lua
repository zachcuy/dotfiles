return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
            -- stylua: ignore
            keys = {
                { "s", mode = { "n", "x", "o" }, false },
                { "S", mode = { "n", "x", "o" }, false },
                { "r", mode = "o", false, },
                { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
                { "<c-s>", mode = { "c" }, false, },
            },
  },
}
