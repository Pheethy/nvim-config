return {
  -- เพิ่ม plugin transparent.nvim เพื่อให้สามารถทำ background เป็น transparent ได้อย่างสมบูรณ์
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 150, -- ให้โหลดหลังจาก colorscheme
    config = function()
      require("transparent").setup({
        groups = { -- กลุ่มของ highlight ที่จะทำให้โปร่งใส
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",
        },
        extra_groups = {
          -- สำหรับ LazyVim และ tokyonight theme โดยเฉพาะ
          "NormalFloat",
          "FloatBorder",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "WhichKeyFloat",
          "NotifyBackground",
          "LspFloatWinNormal",
          -- tokyonight specific groups
          "TokyoNightNormal",
          "TokyoNightNormalNC",
          "TokyoNightTerminal",
          "TokyoNightStatusLine",
          "TokyoNightStatusLineNC",
          "TokyoNightEndOfBuffer",
        },
        exclude_groups = {}, -- กลุ่มที่ไม่ต้องการให้โปร่งใส
      })

      -- เปิดใช้งานโหมดโปร่งใสทันทีเมื่อเริ่ม nvim
      require("transparent").clear_prefix("BufferLine")
      require("transparent").clear_prefix("lualine")
      vim.cmd([[TransparentEnable]])
    end,
  },

  -- เพิ่ม autocmd เพื่อบังคับให้ background เป็น NONE หลังจากโหลด colorscheme
  {
    "nvim-lua/plenary.nvim",
    optional = true,
    config = function()
      -- ตั้งค่าสี background เป็น NONE ทันทีหลังจากโหลด colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
          vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
          vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", ctermbg = "NONE" })
        end,
      })
    end,
  },
}
