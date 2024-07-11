return {
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = {
      open_cmd = "noswapfile vnew",
      live_update = true, -- auto execute search again when you write to any file in vim
      lnum_for_results = true, -- show line number for search/replace results
    },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
    { "<leader>sf", function() require("spectre").open_file_search({search_text="", select_word=false}) end, desc = "Replace in current file (Spectre)" },
  },
  },
}
