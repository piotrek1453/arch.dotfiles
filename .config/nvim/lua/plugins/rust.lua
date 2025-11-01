return {
	{
		"mrcjkb/rustaceanvim",
		opts = {
			server = {
				-- Connect to lspmux server - rust-analyzer caching
				cmd = { "lspmux", "client" },
				default_settings = {
					["rust-analyzer"] = {
						-- Configure rust-analyzer for Leptos/RSX
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
			},
		},
	},
}
