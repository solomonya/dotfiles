return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				python = { "ruff", stop_after_first = true },
			},
			notify_on_error = true,
		})
		local format = function()
			conform.format({ bufnr = vim.api.nvim_get_current_buf() })
		end
		vim.keymap.set("n", "<leader>cf", format, { noremap = true, silent = true, desc = "Format with conform" })
	end,
}
