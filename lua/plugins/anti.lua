return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>ag",
        function()
          require("snacks").terminal.open("agy", {
            win = {
              position = "right",
              width = 0.3,
            },
          })
        end,
        -- desc = "OpenCode (30% right)",
      },
    },
  },
}
