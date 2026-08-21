return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		local profile = require("personal").profile

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "I",
					package_pending = "P",
					package_uninstalled = "X",
				},
			},
		})

		local lsp_ensure_installed = { "lua_ls" }
		if profile == "ts" then
			table.insert(lsp_ensure_installed, "ts_ls")
		elseif profile == "py" then
			table.insert(lsp_ensure_installed, "pyright")
		elseif profile == "clj" then
			table.insert(lsp_ensure_installed, "clojure_lsp")
		end

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = lsp_ensure_installed,
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			-- do NOT auto-enable installed servers; vim.lsp.enable is gated per-profile
			-- in lspconfig.lua. otherwise installed servers attach in every profile.
			automatic_enable = false,
		})

		local tool_ensure_installed = { "stylua" }
		if profile == "ts" then
			table.insert(tool_ensure_installed, "prettierd")
			table.insert(tool_ensure_installed, "eslint_d")
		elseif profile == "py" then
			table.insert(tool_ensure_installed, "ruff")
		end

		mason_tool_installer.setup({
			ensure_installed = tool_ensure_installed,
		})
	end,
}
