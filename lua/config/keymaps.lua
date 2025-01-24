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

-- use Ctrl-E for visual mode inside terminal instead of Ctrl-\ + Ctrl-n
-- tried mapping it to ESC but that didn't work
vim.api.nvim_set_keymap("t", "<C-e>", "<C-\\><C-n>", { noremap = true, silent = true })

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
-- TODO: PR this into avante with something like "Can you fix this on Line: XX -> "
local function yank_current_diagnostic()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1] - 1
  local col = cursor[2]

  -- Get all diagnostics at current line
  local diagnostics = vim.diagnostic.get(0, { lnum = line })

  -- Filter diagnostics to find the closest one to cursor position
  local closest_diagnostic = nil
  local min_distance = math.huge

  for _, diagnostic in ipairs(diagnostics) do
    local distance = math.abs(diagnostic.col - col)
    if distance < min_distance then
      min_distance = distance
      closest_diagnostic = diagnostic
    end
  end

  if closest_diagnostic then
    vim.fn.setreg("+", closest_diagnostic.message)
    vim.notify("Copied diagnostic: " .. closest_diagnostic.message, vim.log.levels.INFO)
  else
    vim.notify("No diagnostic found at cursor position", vim.log.levels.WARN)
  end
end
vim.keymap.set("n", "<leader>cy", yank_current_diagnostic, { desc = "Yank current line's LSP error" })

which_key.add({
  ["<leader>c"] = {
    name = "Code",
    e = { "<cmd>Telescope diagnostics<CR>", "Show all LSP errors" },
    y = { yank_current_diagnostic, "Yank current line's LSP error" },
  },
})

-- Find words
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find words in project" })
which_key.add({
  ["<leader>f"] = {
    w = { "<cmd>Telescope live_grep<CR>", "Find words in project" },
  },
})
