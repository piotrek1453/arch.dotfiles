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
			-- HDL tools & LSPs
			"svls", -- SystemVerilog/Verilog LSP (cargo install svls)
			"rust_hdl",
			"vhdl-style-guide",
		},
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					-- SystemVerilog/Verilog
					svls = {
						filetypes = { "verilog", "systemverilog", "sv", "svh" },
					},
					-- VHDL
					vhdl_ls = {
						-- defaults are OK
					},
				},
			},
		},
	},
}
