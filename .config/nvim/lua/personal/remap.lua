vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- folding like in vscode
map("n", "<C-S-[>", "za", opts)
-- vertical split
map("n", "vv", "<C-w>v", opts)
map("n", "hh", "<C-w><C-n>", opts)

-- splits movements
-- map("n", "<C-J>", "<C-W><C-J>", opts)
-- map("n", "<C-K>", "<C-W><C-K>", opts)
-- map("n", "<C-L>", "<C-W><C-L>", opts)
-- map("n", "<C-H>", "<C-W><C-H>", opts)

-- Disable arrow keys in normal mode
map("n", "<Up>", "<NOP>", opts)
map("n", "<Down>", "<NOP>", opts)
map("n", "<Left>", "<NOP>", opts)
map("n", "<Right>", "<NOP>", opts)

-- Disable arrow keys in insert mode
map("i", "<Up>", "<NOP>", opts)
map("i", "<Down>", "<NOP>", opts)
map("i", "<Left>", "<NOP>", opts)
map("i", "<Right>", "<NOP>", opts)

-- Disable arrow keys in visual mode
map("v", "<Up>", "<NOP>", opts)
map("v", "<Down>", "<NOP>", opts)
map("v", "<Left>", "<NOP>", opts)
map("v", "<Right>", "<NOP>", opts)
