-- Set leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
--
-- All lazy.nvim setup is in lua/config/lazy.lua
require("config.lazy")

-- basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true -- copy indent structure from previous line
vim.opt.preserveindent = true -- preserve as much indent structure as possible
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
