return {
	{
		"linux-cultist/venv-selector.nvim",
		opts = {
			search = {
				my_venvs = {
					command = "fd 'python$' ~/.venv",
				},
			},
		},
	},
}
