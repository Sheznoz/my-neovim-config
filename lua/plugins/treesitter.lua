local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    config = function () 
     local configs = require "nvim-treesitter.configs"

      configs.setup({
		  ensure_installed = {'astro', 'tsx', 'typescript', 'html'},
	      auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
   additional_vim_regex_highlighting = { enable = false },
        })
    end
}

return { M }
