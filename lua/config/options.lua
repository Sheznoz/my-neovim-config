vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd [[colorscheme nightfly]]
require('mini.icons').setup()
vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true
