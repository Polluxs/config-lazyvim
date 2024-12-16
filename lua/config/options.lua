-- generic
vim.opt.tabstop = 4
vim.opt.scrolloff = 15
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

-- MAPPINGS: methods
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- MAPPINGS: impl
map("x", "p", '"_dP', opts)

-- private options
require("config/private-options")
