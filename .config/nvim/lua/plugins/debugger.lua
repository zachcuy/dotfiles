return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "williamboman/mason.nvim",
      optional = true,
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "codelldb" })
        end
      end,
    },
    keys = {
      { "<S-F4>", "<CMD>DapTerminate<CR>", desc = "DAP Terminate" },
      {
        "<F5>",
        function()
          -- (Re-)reads launch.json if present
          if vim.fn.filereadable(".vscode/launch.json") then
            require("dap.ext.vscode").load_launchjs(nil, {
              ["codelldb"] = { "c", "cpp" },
              ["pwa-node"] = { "typescript", "javascript" },
            })
          end

          require("dap").continue()
        end,
        desc = "DAP Continue",
      },
      {
        "<F8>",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      { "<F9>", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
    },
    opts = function()
      local dap = require("dap")
      local codelldb_path = require("mason-registry").get_package("codelldb"):get_install_path() .. "/codelldb"
      if not dap.adapters["codelldb"] then
        dap.adapters["codelldb"] = {
          type = "server",
          port = "${port}",
          executable = {
            command = codelldb_path,
            args = { "--port", "${port}" },
          },
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            name = "Launch Program",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
