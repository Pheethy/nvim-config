return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python", "ninja", "rst" } }, -- เพิ่ม "python"
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          enabled = true,
          before_init = function(_, config)
            -- Resolve the interpreter per project, including uv-created environments.
            local root = config.root_dir or vim.fn.getcwd()
            local candidates = {
              root .. "/.venv/bin/python",
              root .. "/venv/bin/python",
              vim.env.VIRTUAL_ENV and (vim.env.VIRTUAL_ENV .. "/bin/python") or "",
            }
            for _, python in ipairs(candidates) do
              if python ~= "" and vim.fn.executable(python) == 1 then
                config.settings = config.settings or {}
                config.settings.python = config.settings.python or {}
                config.settings.python.pythonPath = python
                break
              end
            end
          end,
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        basedpyright = { enabled = false },
        ruff = {
          enabled = true,
          keys = {
            { "<leader>co", LazyVim.lsp.action["source.organizeImports"], desc = "Organize Imports" },
          },
        },
        ruff_lsp = { enabled = false },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },
      signature = { enabled = true, window = { show_documentation = true } },
    },
  },
  {
    "nvim-neotest/neotest-python",
    -- ต้องเพิ่ม adapter config ถ้าต้องการใช้งาน
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- ตั้งค่าเพิ่ม เช่น path ไป pytest ถ้าต้องการ
            dap = { justMyCode = false }, -- integrate กับ DAP
          }),
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
    config = function()
      if vim.fn.has("win32") == 1 then
        require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
      else
        require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/bin/python"))
      end
    end,
  },
}
