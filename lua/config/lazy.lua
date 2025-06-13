local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" }),
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" }),
  vim.api.nvim_set_hl(0, "Terminal", { bg = "none" }),
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }),
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" }),
  vim.api.nvim_set_hl(0, "Folded", { bg = "none" }),
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }),

  -- transparent background for neotree,
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" }),

  -- transparent background for nvim-tree,
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "none" }),
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" }),
})
