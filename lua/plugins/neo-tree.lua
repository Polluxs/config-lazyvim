return {
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
      { "<leader>e", "<cmd>Oil<CR>", desc = "Explorer Oil" }, -- Also defined in oil.lua: (fights with neo-tree for ordering)
    },
  },
}
