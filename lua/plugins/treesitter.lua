local M ={
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    event = { "BufRead", "BufNewFile" },
    config = function () 
     local configs = require "nvim-treesitter.configs"

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "html", "markdown","astro" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = false },  
   additional_vim_regex_highlighting = { enable = false },
        })
    end
}

return { M }
