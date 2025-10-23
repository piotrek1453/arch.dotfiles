return {
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"codelldb",
				"clang-format",
				"cpplint",
				"cpptools",
				"cmakelang",
				"cmake-language-server",
				"cmakelint",
			},
		},
	},
}
