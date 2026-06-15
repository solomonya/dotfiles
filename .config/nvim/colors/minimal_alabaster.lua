-- ~/.config/nvim/colors/minimal_alabaster.lua

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "minimal_alabaster"
vim.o.background = "dark"
vim.o.termguicolors = true

local p = {
	bg = "#000000",
	fg = "#bcbcbc",
	comment = "#af5f00",
	string = "#7aa89f",
	constant = "#8aa6c1",
	global = "#9fb7d5",
	accent = "#5f8787",
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
hl("NonText", { fg = "#555555" })
hl("Whitespace", { fg = "#333333" })

hl("Cursor", { fg = p.bg, bg = p.fg })
hl("CursorLine", { bg = "#080808" })
hl("CursorLineNr", { fg = p.accent, bg = p.bg })
hl("LineNr", { fg = "#444444", bg = p.bg })

hl("Visual", { bg = "#1c1c1c" })
hl("Search", { fg = p.bg, bg = p.accent })
hl("IncSearch", { fg = p.bg, bg = p.accent })

hl("Pmenu", { fg = p.fg, bg = "#080808" })
hl("PmenuSel", { fg = p.bg, bg = p.accent })
hl("StatusLine", { fg = p.fg, bg = "#111111" })
hl("StatusLineNC", { fg = "#666666", bg = "#080808" })

hl("VertSplit", { fg = "#222222", bg = p.bg })
hl("WinSeparator", { fg = "#222222", bg = p.bg })

hl("DiagnosticError", { fg = p.accent })
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
