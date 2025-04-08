return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()

    -- Basic Harpoon keymaps
    vim.keymap.set("n", "<leader>ba", function()
      harpoon:list():add()
    end, { desc = "Add buffer to Harpoon" })

    -- Quick navigation to pinned buffers (1-4)
    vim.keymap.set("n", "<leader>bf", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon buffer 1" })
    vim.keymap.set("n", "<leader>bd", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon buffer 2" })
    vim.keymap.set("n", "<leader>bs", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon buffer 3" })
    vim.keymap.set("n", "<leader>bv", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon buffer 4" })
    vim.keymap.set("n", "<leader>bc", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon buffer 5" })
    vim.keymap.set("n", "<leader>bx", function()
      harpoon:list():select(6)
    end, { desc = "Harpoon buffer 6" })

    -- Navigation between harpoon buffers
    vim.keymap.set("n", "<leader>j", function()
      harpoon:list():prev()
    end, { desc = "Previous Harpoon buffer" })
    vim.keymap.set("n", "<leader>k", function()
      harpoon:list():next()
    end, { desc = "Next Harpoon buffer" })

    local which_key = require("which-key")
    which_key.add({
      { "<leader>bp", hidden = true },
    })
  end,
}
