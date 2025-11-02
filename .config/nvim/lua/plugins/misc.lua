return {
	-- disable plaintext autocompletion source in all files
	{
		"saghen/blink.cmp",
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
