-- HDL (Verilog/SystemVerilog/VHDL) support
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"verilog",
				"systemverilog",
				"vhdl",
			},
		},
	},
	{
		"mason.nvim",
		opts = {
			ensure_installed = {
				"svls", -- additional SV LSP
				"verible", -- Verilog/SystemVerilog formatter and LSP
				-- -- this one seems broken whether installed by Mason or manually
				-- "hdl-checker", -- universal
				"vsg", -- VHDL Style Guide formatter+linter
				"rust_hdl", -- VHDL LSP
			},
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- SystemVerilog / Verilog
				verible = {
					filetypes = {
						"verilog",
						"systemverilog",
						"sv",
						"svh",
					},
					cmd = {
						"verible-verilog-ls",
						"--rules_config_search",
					},
				},
				svls = {
					filetypes = { "verilog", "systemverilog", "sv", "svh" },
				},
				-- VHDL
				vhdl_ls = {},
			},
		},
	},
	-- linting
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				vhd = { "vsg" },
				vhdl = { "vsg" },
			},
		},
	},
	-- formatters
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				vsg = {
					append_args = { "--fix" },
				},
				verible = {
					append_args = {
						"--column_limit",
						"79",
					},
				},
			},
			formatters_by_ft = {
				-- SystemVerilog / Verilog
				verilog = { "verible" },
				systemverilog = { "verible" },
				sv = { "verible" },
				svh = { "verible" },
				-- vhdl
				vhdl = { "vsg" },
				vhd = { "vsg" },
			},
		},
	},
}
