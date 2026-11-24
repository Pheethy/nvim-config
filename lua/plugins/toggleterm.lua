return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "vertical" then
          return vim.o.columns * 0.4 -- ความกว้าง 40% ของหน้าจอ
        else
          return 20
        end
      end,
      direction = "vertical", -- เปิดเป็น sidebar ด้านขวา
      float_opts = {
        border = "curved", -- ถ้าใช้ float แทน
      },
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      close_on_exit = true,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      -- ตั้งค่าให้ terminal อยู่ด้านขวา
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          vim.cmd("wincmd L") -- ย้าย terminal ไปด้านขวา
        end,
      })
    end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      right = {
        { title = "Terminal", ft = "toggleterm", size = { width = 0.4 } },
      },
    },
  },
}
