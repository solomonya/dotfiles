return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		-- cmp capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP Actions",
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = true,
						silent = true,
						noremap = true,
					})
				end

				bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
				bufmap("n", "<leader>rn", vim.lsp.buf.rename)
				bufmap("n", "<leader>d", vim.diagnostic.open_float)
				bufmap("n", "K", vim.lsp.buf.hover)
				bufmap("n", "<leader>ss", vim.lsp.buf.document_symbol)
				bufmap("n", "<leader>rs", "<cmd>LspRestart<CR>")
				bufmap("n", "<leader>ld", vim.lsp.buf.definition)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = 0 })
			end,
		})

		-- Diagnostics
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "E",
					[vim.diagnostic.severity.WARN] = "W",
					[vim.diagnostic.severity.INFO] = "I",
					[vim.diagnostic.severity.HINT] = "H",
				},
			},
			virtual_text = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- ======================
		-- LSP SERVER CONFIGS
		-- ======================

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
		})

		vim.lsp.config("pyright", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- ======================
		-- ENABLE SERVERS
		-- ======================

		vim.lsp.enable("ts_ls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("lua_ls")
	end,
}
