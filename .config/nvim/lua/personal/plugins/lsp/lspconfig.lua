return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP Actions",
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- set keybinds
				bufmap("n", "gR", "<cmd>Telescope lsp_references<CR>") -- show definition, references
				bufmap("n", "gD", vim.lsp.buf.declaration) -- go to declaration
				bufmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>") -- show lsp definitions
				bufmap("n", "gi", "<cmd>Telescope lsp_implementations<CR>") -- show lsp implementations
				bufmap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>") -- show lsp type definitions
				bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection
				bufmap("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename
				bufmap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>") -- show  diagnostics for file
				bufmap("n", "<leader>d", vim.diagnostic.open_float) -- show diagnostics for line
				bufmap("n", "[d", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer
				bufmap("n", "]d", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer
				bufmap("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor
				bufmap("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
