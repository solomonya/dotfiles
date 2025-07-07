return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "ivy",
				},
				live_grep = {
					theme = "ivy",
				},
			},
			extensions = {
				fzf = {},
			},
		})
		require("telescope").load_extension("fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } })
		end, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
