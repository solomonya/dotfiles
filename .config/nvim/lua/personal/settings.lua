vim.wo.relativenumber = true
vim.g.netrw_banner = 0

vim.cmd("set number")
vim.cmd("let g:sneak#label = 1")
vim.cmd("highlight Normal ctermbg=Black")
vim.cmd("set background=dark")
vim.cmd("filetype plugin on")

-- color column settings
local colorcolumn_group = vim.api.nvim_create_augroup("CustomColorColumn", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = colorcolumn_group,
	pattern = "*", -- Срабатывает для всех файлов
	callback = function(args)
		local filename = vim.api.nvim_buf_get_name(args.buf)

		if string.find(filename, "tasks%.txt") then
			vim.opt_local.colorcolumn = ""
		else
			vim.opt_local.colorcolumn = "76"
		end
	end,
})

vim.cmd("set ignorecase")
vim.cmd("set smartcase")

vim.opt.textwidth = 75

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

-- indenting by tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
