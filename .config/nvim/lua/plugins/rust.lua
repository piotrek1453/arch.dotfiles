return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"rust-analyzer",
			},
		},
	},
	{
		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = { features = "all" },
					procMacro = {
						ignored = {
							leptos_macro = {
								-- optional: --
								-- "component",
								"server",
							},
						},
					},
				},
			},
		}),
	},
}
