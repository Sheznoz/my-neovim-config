return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        hl.Comment = {
          fg = "#77f538",
          italic = true,
        }
      end,
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Set transparent backgrounds for UI components
      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "EndOfBuffer",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeFloatTitle",
        "TelescopeNormal",
        "TelescopeBorder",
        "FloatBorder",
        "WhichKey",
        "WhichKeyBorder",
        "WhichKeyFloat",
        "WhichKeySeparator",
        "WhichKeyGroup",
        "WhichKeyDesc",
      }

      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      highlights = {
        fill = { bg = "none" }, -- Right of tabs
        background = { bg = "none" }, -- Inactive tabs
        tab = { bg = "none" },
        tab_selected = { bg = "none" },
        tab_separator = { bg = "none" },
        tab_separator_selected = { bg = "none" },
        separator = { bg = "none" },
        separator_selected = { bg = "none" },
        separator_visible = { bg = "none" },
      },
    },
  },
}
