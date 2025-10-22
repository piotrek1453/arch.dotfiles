return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				-- show hidden files in explorer by default
				hidden = true,
				ignored = true,
				sources = {
					files = {
						hidden = true,
						ignored = true,
					},
				},
			},
		},
	},
}
