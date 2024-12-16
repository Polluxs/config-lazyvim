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
      { "<leader>e", "<cmd>Oil<CR>", desc = "Explorer Oil" }, -- Bind <leader>e to Oil
    },
  },

  -- Neo-tree configuration (override default to allow oil)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        hijack_netrw = false, -- Prevent Neo-tree from taking over the default file explorer
      },
    },
    keys = {
      { "<leader>E", "<cmd>Neotree toggle<CR>", desc = "Explorer Neo-tree" }, -- Bind <leader>E to Neo-tree
    },
  },
}
