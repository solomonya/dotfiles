local ft = { "clojure", "clojurescript", "edn" }

return {
	{
		"julienvincent/nvim-paredit",
		ft = ft,
		config = function()
			require("nvim-paredit").setup()
		end,
	},
	{
		"Olical/conjure",
		ft = ft,
		config = function()
			vim.g["conjure#log#hud#enabled"] = false
		end,
	},
}
