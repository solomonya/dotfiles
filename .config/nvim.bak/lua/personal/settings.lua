vim.wo.relativenumber = true
vim.g.netrw_banner = 0

vim.cmd("set number")
vim.cmd("colorscheme habamax")
vim.cmd("let g:sneak#label = 1")
vim.cmd("highlight Normal ctermbg=Black")
vim.cmd("set background=dark")
vim.cmd("filetype plugin on")
vim.cmd("set colorcolumn=80")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- vim.cmd('highlight ColorColumn ctermbg=DarkGray')
-- vim.cmd('set colorcolumn=80')

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- vim.opt.foldnestmax = 4

vim.diagnostic.config({ virtual_text = false })
vim.opt.completeopt = { "menu", "menuone", "noselect" }
