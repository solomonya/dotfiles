vim.g.mapleader = " "

function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }

-- tabs
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<leader>tj", ":tabnext<CR>")
map("n", "<leader>tk", ":tabprevious<CR>")

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

map("n", "<leader>d", ":bdelete") -- delete current buffer

-- folding like in vscode
map("n", "<C-S-[>", "za", opts)
-- vertical split
map("n", "<C-w>v", "<C-w>v", opts)
map("n", "<C-w>h", "<C-w><C-n>", opts)
map("n", "<C-w>x", "<C-w>q", opts)

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
