return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
			},
		})
		local function format_current_buffer()
			local bufnr = vim.api.nvim_get_current_buf()
			conform.format({ bufnr = bufnr })
		end

		vim.keymap.set("n", "<C-S-I>", format_current_buffer, { noremap = true, silent = true })
	end,
}
