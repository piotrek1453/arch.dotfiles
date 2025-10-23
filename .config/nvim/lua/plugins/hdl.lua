-- HDL (Verilog/SystemVerilog/VHDL) support
return {
	-- Ensure Treesitter grammars for HDL
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			-- add without duplicating
			local to_add = { "verilog", "vhdl" }
			for _, lang in ipairs(to_add) do
				local exists = false
				for _, l in ipairs(opts.ensure_installed) do
					if l == lang then
						exists = true
						break
					end
				end
				if not exists then
					table.insert(opts.ensure_installed, lang)
				end
			end
		end,
	},

	-- Install HDL language servers via mason
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			local tools = {
				-- HDL tools & LSPs
				"svls", -- SystemVerilog/Verilog LSP (cargo install svls)
				"rust_hdl",
				"vhdl-style-guide",
			}
			for _, tool in ipairs(tools) do
				local exists = false
				for _, t in ipairs(opts.ensure_installed) do
					if t == tool then
						exists = true
						break
					end
				end
				if not exists then
					table.insert(opts.ensure_installed, tool)
				end
			end
		end,
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
				vhdl_ls = {
					-- defaults are OK
				},
			},
		},
	},
}
