-- generic
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.scrolloff = 15
vim.o.clipboard = "unnamedplus"
vim.o.guifont = "FiraCode Nerd Font Med"
vim.g.neovide_scale_factor = 1.4

-- Automatically set file type to markdown for .md and .MD files
vim.cmd([[
  augroup markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md,*.MD set filetype=markdown
  augroup END
]])

---@diagnostic disable-next-line: unused-local, unused-function
local function reload_config()
  for name, _ in pairs(package.loaded) do
    if name:match("^config") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print("Configuration reloaded!")
end

-- MAPPINGS: methods
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- MAPPINGS: impl
map("n", "<leader>rr", ":lua reload_config()<CR>", opts)
map("x", "p", '"_dP', opts)

-- private options
require("config/private-options")
