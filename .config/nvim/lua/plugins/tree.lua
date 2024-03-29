return {
  -- Change default permissions for files created via Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        -- keybinds for going to root folder
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },

      -- keybinds for current working directory (from terminal)
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>t", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
        },
        window = {
          mappings = {
            ["L"] = "open_nofocus",
          },
        },
        commands = {
          open_nofocus = function(state)
            require("neo-tree.sources.filesystem.commands").open(state)
            vim.schedule(function()
              vim.cmd([[Neotree focus]])
            end)
          end,
        },
      },
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      event_handlers = {
        --[[ change default permissions of newly created files ]]
        {
          event = "file_added",
          handler = function(destination)
            local uv = vim.loop
            local file_info = uv.fs_stat(destination)
            if not file_info then
              return
            elseif file_info.type == "file" then
              uv.fs_chmod(destination, 436) -- (436 base 10) == (664 base 8)
            elseif file_info.type == "directory" then
              uv.fs_chmod(destination, 509) -- 644 does not work for directories I guess?
            end
          end,
        },
      },
    },
  },
}
