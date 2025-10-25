return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "css", "scss" },
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"tailwindcss-language-server",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = false,
				tailwindcss = {
					filetypes = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "rust" },
					settings = {
						tailwindCSS = { includeLanguages = { rust = "html" } },
					},
				},
			},
		},
	},
}
