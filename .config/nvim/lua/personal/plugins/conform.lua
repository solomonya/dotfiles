return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		-- Helper function to find prettier config files
		local function has_prettier_config(ctx)
			local local_config = vim.fs.find({
				".prettierrc",
				".prettierrc.json",
				".prettierrc.yml",
				".prettierrc.yaml",
				".prettierrc.json5",
				".prettierrc.js",
				".prettierrc.cjs",
				"prettier.config.js",
				"prettier.config.cjs",
				"prettier.config.mjs",
			}, { path = ctx.filename, upward = true })[1]

			return local_config
		end

		local javascript_settings = { "biome", "prettierd", "prettier", stop_after_first = true }

		conform.setup({
			-- Define custom conditions for formatters here
			formatters = {
				biome = {
					condition = function(self, ctx)
						return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
					end,
				},
				prettier = {
					condition = function(self, ctx)
						return has_prettier_config(ctx)
					end,
				},
				prettierd = {
					condition = function(self, ctx)
						return has_prettier_config(ctx)
					end,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = javascript_settings,
				typescript = javascript_settings,
				javascriptreact = javascript_settings,
				typescriptreact = javascript_settings,
			},
			notify_on_error = true,
		})

		local format = function()
			conform.format({ bufnr = vim.api.nvim_get_current_buf() })
		end

		vim.keymap.set("n", "<leader>cf", format, { noremap = true, silent = true, desc = "Format with conform" })
	end,
}
