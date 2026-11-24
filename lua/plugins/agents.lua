return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>oc",
        function()
          require("snacks").terminal.open("pi", {
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
