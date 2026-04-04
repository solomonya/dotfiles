vim.cmd("syntax off")
vim.opt.syntax = "off"

vim.api.nvim_set_hl(0, "Normal", { fg = "#c0c0c0", bg = "#000000" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#c0c0c0", bg = "#000000" })

local groups = {
	"Comment",
	"Constant",
	"Identifier",
	"Statement",
	"PreProc",
	"Type",
	"Special",
	"Underlined",
	"Ignore",
	"Error",
	"Todo",

	"String",
	"Character",
	"Number",
	"Boolean",
	"Float",

	"Function",

	"Conditional",
	"Repeat",
	"Label",
	"Operator",
	"Keyword",
	"Exception",

	"Include",
	"Define",
	"Macro",
	"PreCondit",

	"StorageClass",
	"Structure",
	"Typedef",

	"SpecialChar",
	"Tag",
	"Delimiter",
	"SpecialComment",
	"Debug",

	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"Conceal",
	"Cursor",
	"CursorColumn",
	"CursorLine",
	"Directory",
	"DiffAdd",
	"DiffChange",
	"DiffDelete",
	"DiffText",
	"EndOfBuffer",
	"ErrorMsg",
	"VertSplit",
	"WinSeparator",
	"Folded",
	"FoldColumn",
	"SignColumn",
	"IncSearch",
	"Search",
	"Substitute",
	"CursorLineNr",
	"MatchParen",
	"MsgArea",
	"NonText",
	"SpecialKey",

	"Pmenu",
	"PmenuSel",
	"PmenuSbar",
	"PmenuThumb",

	"SpellBad",
	"SpellCap",
	"SpellLocal",
	"SpellRare",

	"StatusLine",
	"StatusLineNC",
	"TabLine",
	"TabLineFill",
	"TabLineSel",
	"Title",
	"VisualNOS",
	"WarningMsg",
	"Whitespace",
	"WildMenu",

	"DiagnosticError",
	"DiagnosticWarn",
	"DiagnosticInfo",
	"DiagnosticHint",
	"DiagnosticUnderlineError",
	"DiagnosticUnderlineWarn",
	"DiagnosticUnderlineInfo",
	"DiagnosticUnderlineHint",
}

for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { fg = "#c0c0c0", bg = "#000000", ctermfg = "gray", ctermbg = "black" })
end

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#c0c0c0", ctermbg = "darkgray" })
