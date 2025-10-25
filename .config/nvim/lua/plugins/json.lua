return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"json-lsp",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jsonls = { opts = {} },
			},
		},
	},
}
