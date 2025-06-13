return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = {
      nls.builtins.formatting.clang_format,
      nls.builtins.diagnostics.cpplint,
    }
  end,
}
