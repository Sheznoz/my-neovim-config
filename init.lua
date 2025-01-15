vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("config.remap")
require("config.options")
require("config.lspconfig")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
	end,
})
