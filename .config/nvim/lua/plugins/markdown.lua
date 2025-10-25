return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = function()
			-- Full override of render-markdown settings from LazyVim spec
			return {
				enabled = true,
				render_modes = { "n", "c" },
				heading = { enabled = true },
				code = { enabled = true, style = "full" },
				latex = { enabled = true },
				bullet = { enabled = true },
				checkbox = { enabled = true },
				quote = { enabled = true },
				pipe_table = { enabled = true },
			}
		end,
	},
}
