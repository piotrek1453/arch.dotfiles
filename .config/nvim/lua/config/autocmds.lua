-- Force spell off globally and keep overriding late
vim.opt.spell = false
local nospell_grp = vim.api.nvim_create_augroup("NoSpellAll", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter", "BufEnter", "InsertEnter" }, {
	group = nospell_grp,
	pattern = "*",
	callback = function()
		vim.opt_local.spell = false
	end,
})
