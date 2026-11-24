return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "deepseek",
    tools = {
      "edit",
    },
    log_level = "debug",
    providers = { -- ✅ ใช้ "vendors" สำหรับ deepseek (โครงสร้างนี้ถูกต้องแล้ว)
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-flash",
      },
    },
  },
  build = "make",
  dependencies = {
    { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
