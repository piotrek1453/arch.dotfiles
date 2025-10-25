return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"emmet-language-server",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				emmet_ls = {
					filetypes = { "css", "html", "rust" },
					init_options = {
						includeLanguages = {
							rust = "html",
						},
					},
				},
			},
		},
	},
}
