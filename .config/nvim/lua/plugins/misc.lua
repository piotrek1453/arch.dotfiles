return {
	{
		"hrsh7th/nvim-cmp",
		opts = {
			experimental = {
				ghost_text = true,
			},
		},
	},
	{
		"saghen/blink.cmp",
		-- disable plaintext source
		opts = function(_, opts)
			local sources = opts.sources or {}
			local default_sources = sources.default or {}

			sources.default = vim.tbl_filter(function(name)
				return name ~= "buffer"
			end, default_sources)

			opts.sources = sources
			return opts
		end,
	},
}
