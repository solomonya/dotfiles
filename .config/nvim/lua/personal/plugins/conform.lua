return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local profile = require("personal").profile

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

		local javascript_settings = { "biome", "prettierd", stop_after_first = true }

		local formatters_by_ft = {
			lua = { "stylua" },
		}

		if profile == "ts" then
			formatters_by_ft.javascript = javascript_settings
			formatters_by_ft.typescript = javascript_settings
			formatters_by_ft.javascriptreact = javascript_settings
			formatters_by_ft.typescriptreact = javascript_settings
			formatters_by_ft.json = javascript_settings
		elseif profile == "py" then
			formatters_by_ft.python = { "ruff_format" }
		end

		conform.setup({
			-- Define custom conditions for formatters here
			formatters = {
				biome = {
					condition = function(self, ctx)
						return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
					end,
				},

				prettierd = {
					condition = function(self, ctx)
						return has_prettier_config(ctx)
					end,
				},
			},
			formatters_by_ft = formatters_by_ft,
			notify_on_error = true,
		})

		local format = function()
			conform.format({ bufnr = vim.api.nvim_get_current_buf() })
		end

		vim.keymap.set("n", "<leader>cf", format, { noremap = true, silent = true, desc = "Format with conform" })
	end,
}
