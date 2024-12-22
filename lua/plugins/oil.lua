return {
  -- Oil.nvim configuration
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true, -- Show hidden files and directories
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>Oil<CR>", desc = "Explorer Oil" }, -- Also defined in oil.lua: (fights with neo-tree for ordering)
    },
  },
}
