vim.wo.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.cmd("set number")
vim.cmd('highlight ColorColumn ctermbg=DarkGray')
-- vim.cmd('set colorcolumn=80')

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4

vim.diagnostic.config({ virtual_text = false })
vim.opt.completeopt = { "menu", "menuone", "noselect" }
