return {
	-- add TeX completions for math symbols etc
	{
		"saghen/blink.cmp",
		dependencies = {
			"erooke/blink-cmp-latex",
		},
		opts = {
			sources = {
				default = { "latex" },
				providers = {
					latex = {
						name = "Latex",
						module = "blink-cmp-latex",
						opts = {
							-- set to true to insert the latex command instead of the symbol
							insert_command = true,
						},
					},
				},
			},
		},
	},
}
