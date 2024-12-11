vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

vim.cmd("set nocompatible")
vim.cmd("set number")
vim.cmd("colorscheme habamax")
vim.cmd("let g:sneak#label = 1")
vim.cmd("highlight Normal ctermbg=Black")
vim.cmd("set background=dark")
-- vim.cmd('highlight ColorColumn ctermbg=DarkGray')
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

