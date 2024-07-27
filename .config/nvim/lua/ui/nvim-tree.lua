return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)
        end,

        update_focused_file = {
          enable = true,
        },

        actions = {
          open_file = {
            quit_on_open = true,
          },
        },

        git = {
          enable = true,
        },

        sort = {
          sorter = "case_sensitive",
        },

        view = {
          adaptive_size = true,
          relativenumber = true,
        },

        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              git = true,
            },
          },
        },

        filters = {
          dotfiles = false,
          custom = {
            "node_modules/.*",
          },
        },

        log = {
          enable = true,
          truncate = true,
          types = {
            diagnostics = true,
            git = true,
            profile = true,
            watcher = true,
          },
        },
      })

      if vim.fn.argc(-1) == 0 then
        vim.cmd("NvimTreeFocus")
      end
    end,
  },
}
