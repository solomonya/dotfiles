return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						file = false,
						folder = false,
						folder_arrow = false,
						git = false,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
}
