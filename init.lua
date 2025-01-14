vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup()
require("config.remap")
require("config.options")


