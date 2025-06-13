return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    -- Force transparent backgrounds
    local function transparent(name)
      return { bg = "none", fg = vim.api.nvim_get_hl(0, { name = name }).fg }
    end

    -- Override highlights directly
    opts.highlight = {
      StatusLine = { bg = "none" },
      StatusLineNC = { bg = "none" },
    }

    opts.highlights = {
      HeirlineNormal = transparent("HeirlineNormal"),
      HeirlineInsert = transparent("HeirlineInsert"),
      HeirlineVisual = transparent("HeirlineVisual"),
      HeirlineReplace = transparent("HeirlineReplace"),
      HeirlineCommand = transparent("HeirlineCommand"),
      HeirlineTerminal = transparent("HeirlineTerminal"),
      HeirlineFileName = transparent("HeirlineFileName"),
      HeirlineFileType = transparent("HeirlineFileType"),
      HeirlineLocation = transparent("HeirlineLocation"),
      HeirlineGit = transparent("HeirlineGit"),
      HeirlineDiagnostics = transparent("HeirlineDiagnostics"),
      HeirlineLSP = transparent("HeirlineLSP"),
    }

    return opts
  end,
}
