return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"markdownlint",
				"markdown-toc",
				"mdformat",
			},
		},
	},
}
