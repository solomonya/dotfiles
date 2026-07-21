-- ~/.config/nvim/colors/alabaster_light.lua

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "alabaster_light"
vim.o.background = "light"
vim.o.termguicolors = true

local p = {
	bg = "#F7F7F7",
	fg = "#000000",
	comment = "#AA3731",
	string = "#448C27",
	constant = "#7A3E9D",
	global = "#325CC0",
	accent = "#007ACC",
	none = "NONE",
}

local function hl(group, opts)
	opts = opts or {}
	opts.bold = false
	opts.italic = false
	opts.underline = false
	vim.api.nvim_set_hl(0, group, opts)
end

-- Clear existing semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	hl(group, {})
end

-- Base UI
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalNC", { fg = p.fg, bg = p.bg })
hl("SignColumn", { fg = p.fg, bg = p.bg })
hl("EndOfBuffer", { fg = p.bg, bg = p.bg })
hl("NonText", { fg = "#CCCCCC" })
hl("Whitespace", { fg = "#DDDDDD" })

hl("Cursor", { fg = p.bg, bg = p.accent })
hl("CursorLine", { bg = "#F0F0F0" })
hl("CursorLineNr", { fg = p.accent, bg = p.bg })
hl("LineNr", { fg = "#9DA39A", bg = p.bg })

hl("Visual", { bg = "#BFDBFE" })
hl("Search", { fg = p.fg, bg = "#FFBC5D" })
hl("IncSearch", { fg = p.fg, bg = "#FFBC5D" })

hl("Pmenu", { fg = p.fg, bg = "#F0F0F0" })
hl("PmenuSel", { fg = p.fg, bg = "#DDDDDD" })
hl("StatusLine", { fg = "#474747", bg = "#DDDDDD" })
hl("StatusLineNC", { fg = "#9DA39A", bg = "#F0F0F0" })

hl("VertSplit", { fg = "#CCCCCC", bg = p.bg })
hl("WinSeparator", { fg = "#CCCCCC", bg = p.bg })

hl("DiagnosticError", { fg = p.comment })
hl("DiagnosticWarn", { fg = p.accent })
hl("DiagnosticInfo", { fg = p.accent })
hl("DiagnosticHint", { fg = p.accent })

-- Alabaster-style syntax classes
hl("Comment", { fg = p.comment })

hl("String", { fg = p.string })
hl("Character", { fg = p.string })

hl("Constant", { fg = p.constant })
hl("Number", { fg = p.constant })
hl("Float", { fg = p.constant })
hl("Boolean", { fg = p.constant })

hl("Function", { fg = p.global })
hl("Identifier", { fg = p.fg })

-- Do NOT highlight language keywords
hl("Statement", { fg = p.fg })
hl("Conditional", { fg = p.fg })
hl("Repeat", { fg = p.fg })
hl("Label", { fg = p.fg })
hl("Operator", { fg = p.fg })
hl("Keyword", { fg = p.fg })
hl("Exception", { fg = p.fg })

hl("PreProc", { fg = p.fg })
hl("Include", { fg = p.fg })
hl("Define", { fg = p.fg })
hl("Macro", { fg = p.fg })
hl("PreCondit", { fg = p.fg })

hl("Type", { fg = p.fg })
hl("StorageClass", { fg = p.fg })
hl("Structure", { fg = p.fg })
hl("Typedef", { fg = p.fg })

hl("Special", { fg = p.fg })
hl("SpecialChar", { fg = p.fg })
hl("Tag", { fg = p.fg })
hl("Delimiter", { fg = p.fg })
hl("SpecialComment", { fg = p.comment })
hl("Debug", { fg = p.fg })

-- Treesitter
hl("@comment", { link = "Comment" })

hl("@string", { link = "String" })
hl("@string.escape", { link = "String" })
hl("@character", { link = "Character" })

hl("@constant", { link = "Constant" })
hl("@constant.builtin", { link = "Constant" })
hl("@number", { link = "Number" })
hl("@float", { link = "Float" })
hl("@boolean", { link = "Boolean" })

hl("@function", { link = "Function" })
hl("@function.builtin", { fg = p.fg })
hl("@function.call", { fg = p.fg })
hl("@constructor", { fg = p.fg })

hl("@variable", { fg = p.fg })
hl("@variable.builtin", { fg = p.fg })
hl("@property", { fg = p.fg })
hl("@field", { fg = p.fg })
hl("@parameter", { fg = p.fg })

hl("@keyword", { fg = p.fg })
hl("@keyword.function", { fg = p.fg })
hl("@keyword.return", { fg = p.fg })
hl("@keyword.operator", { fg = p.fg })
hl("@conditional", { fg = p.fg })
hl("@repeat", { fg = p.fg })
hl("@operator", { fg = p.fg })
hl("@punctuation.delimiter", { fg = p.fg })
hl("@punctuation.bracket", { fg = p.fg })
hl("@punctuation.special", { fg = p.fg })

hl("@type", { fg = p.fg })
hl("@type.builtin", { fg = p.fg })
hl("@namespace", { fg = p.fg })
hl("@module", { fg = p.fg })

-- LSP semantic tokens: disable fireworks
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	hl(group, {})
end

-- But keep reliable global-ish definitions
hl("@lsp.type.function", { link = "Function" })
hl("@lsp.type.method", { fg = p.fg })
hl("@lsp.type.class", { fg = p.global })
hl("@lsp.type.interface", { fg = p.global })
hl("@lsp.type.enum", { fg = p.global })

-- UI Elements
hl("Directory", { fg = p.fg })
hl("NormalFloat", { fg = p.fg, bg = "#F0F0F0" })
hl("FloatBorder", { fg = "#CCCCCC", bg = "#F0F0F0" })

