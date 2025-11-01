return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd("colorscheme oxocarbon")

			-- tweaks
			vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#5c6773" }) -- hidden files less dimmed
		end,
	},
}
