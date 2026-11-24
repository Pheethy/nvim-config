return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- แสดง hidden files
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      width = 30,
    },
  },
}
