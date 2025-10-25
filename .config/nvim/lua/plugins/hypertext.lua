return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"emmet-language-server",
				"tailwindcss-language-server",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				emmet_language_server = {
					-- Only for Rust (Leptos), not HTML
					filetypes = { "rust" },
					init_options = {
						includeLanguages = {
							rust = "html",
						},
					},
				},
				tailwindcss = {
					filetypes_include = { "rust" },
					settings = {
						tailwindCSS = {
							includeLanguages = {
								rust = "html",
							},
						},
					},
				},
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local ok, cmp = pcall(require, "cmp")
			if not ok then
				return opts
			end

			-- HTML: only LuaSnip snippets
			cmp.setup.filetype("html", {
				sources = {
					{ name = "luasnip" },
				},
			})

			-- Rust: add LuaSnip for HTML snippets in Leptos
			cmp.setup.filetype("rust", {
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})

			return opts
		end,
	},
}
