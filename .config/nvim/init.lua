-- Set leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- All lazy.nvim setup is in lua/config/lazy.lua
require("config.lazy")

-- basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
