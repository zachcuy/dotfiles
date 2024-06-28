return {
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = {
      open_cmd = "noswapfile vnew",
    },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
    { "<leader>sf", function() require("spectre").open_file_search({select_word=false}) end, desc = "Replace in current file (Spectre)" },
  },
  },
}
