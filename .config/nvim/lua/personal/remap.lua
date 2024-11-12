vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- folding like in vscode
map("n", "<C-S-[>", "za", opts)
-- vertical split
map("n", "<C-a>v", "<C-w>v", opts)
map("n", "<C-a>h", "<C-w><C-n>", opts)
map("n", "<C-a>x", "<C-w>q", opts)

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
