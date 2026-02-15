return {
	"ibhagwan/fzf-lua",
	opts = {},
	config = function()
		local fzf_lua = require("fzf-lua")
		fzf_lua.setup({
			winopts = {
				fullscreen = true,
			},
		})
		vim.keymap.set("n", "<leader>ff", fzf_lua.files)
		vim.keymap.set("n", "<leader>fb", fzf_lua.buffers)
		vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep)
		vim.keymap.set("n", "<leader>fr", fzf_lua.resume)
	end,
}
