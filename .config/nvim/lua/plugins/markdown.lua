return {
	-- Ensure Treesitter parsers for Markdown
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts = opts or {}
			opts.ensure_installed = opts.ensure_installed or {}
			local ensure = {}
			for _, v in ipairs(opts.ensure_installed) do
				ensure[v] = true
			end
			ensure["markdown"] = true
			ensure["markdown_inline"] = true
			local list = {}
			for k, _ in pairs(ensure) do
				table.insert(list, k)
			end
			opts.ensure_installed = list
			return opts
		end,
	},

	-- Optional: Markdown tooling
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"markdownlint",
				"markdown-toc",
				"mdformat",
			},
		},
	},

	-- Render Markdown inline
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "markdown.mdx", "quarto", "rmd" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-mini/mini.icons",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			render_modes = { "n", "c" },
			heading = { enabled = true },
			code = { enabled = true, style = "full" },
			latex = { enabled = false },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
		end,
		init = function()
			local patterns = { "markdown", "markdown.mdx", "quarto", "rmd" }
			local function try_enable()
				pcall(function()
					require("lazy").load({ plugins = { "render-markdown.nvim" } })
				end)
				vim.schedule(function()
					local ok, rm = pcall(require, "render-markdown")
					if ok and rm and rm.enable then
						pcall(rm.enable)
					end
				end)
			end
			vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter" }, {
				pattern = patterns,
				callback = try_enable,
			})
		end,
	},
}
