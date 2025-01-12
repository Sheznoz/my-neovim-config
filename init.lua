vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("config.remap")

vim.g.maplocalleader = "\\"
vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd [[colorscheme nightfly]]
require('mini.icons').setup()
vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
