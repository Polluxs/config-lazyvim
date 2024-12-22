-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
--###############
--#   utility   #
--###############
if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- also comment with Command + /
vim.keymap.set({ "n", "v" }, "<D-/>", "gcc", { remap = true })

--###############
--#  navigation #
--###############

-- Switch `{` and `}` navigation to be consistent with `j` and `k`
vim.api.nvim_set_keymap("n", "{", "}", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "}", "{", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "{", "}", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "}", "{", { noremap = true, silent = true })

--###############
--#   plugins   #
--###############
local which_key = require("which-key")

-- Key mappings for Obsidian.nvim commands
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Create a new note" })
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open a specific note" })
vim.keymap.set("n", "<leader>ol", ":ObsidianLink<CR>", { desc = "Create a link to another note" })
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Open today's daily note" })
vim.keymap.set("n", "<leader>op", ":ObsidianTemplate<CR>", { desc = "Insert a template" })
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Search notes using Telescope" })
vim.keymap.set("n", "<leader>oq", ":ObsidianSearch ", { desc = "Search or create notes with query" })

which_key.add({
  ["<leader>o"] = {
    name = "Obsidian",
    n = { ":ObsidianNew<CR>", "Create a new note" },
    o = { ":ObsidianOpen<CR>", "Open a specific note" },
    s = { ":ObsidianSearch<CR>", "Search notes using Telescope" },
    l = { ":ObsidianLink<CR>", "Create a link to another note" },
    t = { ":ObsidianToday<CR>", "Open today's daily note" },
    p = { ":ObsidianTemplate<CR>", "Insert a template" },
    q = { ":ObsidianSearch ", "Search or create notes with query" },
  },
})

-- show code errors
vim.api.nvim_set_keymap("n", "<leader>ce", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
which_key.add({
  ["<leader>c"] = {
    name = "Code",
    e = { "<cmd>Telescope diagnostics<CR>", "Show all LSP errors" },
  },
})
