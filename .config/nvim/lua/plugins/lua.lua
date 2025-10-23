return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"luacheck",
				"stylua",
			},
		},
	},
}
