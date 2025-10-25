-- HDL (Verilog/SystemVerilog/VHDL) support
return {
	-- Ensure Treesitter grammars for HDL
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"verilog",
				"vhdl",
			},
		},
	},

	-- Install HDL language servers via mason
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"svls",
				"rust_hdl",
			},
		},
	},

	-- Configure LSP servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- SystemVerilog/Verilog
				svls = {
					filetypes = { "verilog", "systemverilog", "sv", "svh" },
				},
				-- VHDL
				vhdl_ls = {},
			},
		},
	},
}
