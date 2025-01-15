local map = vim.keymap.set
-- Standard custom
map("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy.vim" })
map("n", "<leader>s", vim.cmd.w, { desc = "Save" })
map("n", "<leader>q", function() vim.cmd("bd") end, { desc = "Close buffer" })
map('n', 'grn', vim.lsp.buf.rename, { desc = "Rename" })
map('n', 'ga', vim.lsp.buf.code_action, { desc = "Code action" })
map('n', 'gR', "<cmd>Telescope lsp_references<CR>", { desc = "References" })
map('n', 'gi', "<cmd>Telescope lsp_implementations<CR>", { desc = "References" })
map('n', 'gd', "<cmd>Telescope lsp_definitions<CR>", { desc = "Definitions" })
map('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to definition" })

-- Neotree
map("n", "<leader>p", function() vim.cmd("Neotree toggle source=last") end, { desc = "Neotree toggle" })

-- Telescope
local telescope = require('telescope.builtin')
map('n', '<leader>f', function() telescope.find_files() end, { desc = "Fuzzy find" })
map('n', '<leader>g', function() telescope.git_files() end, { desc = "Git fuzzy find" })
map('n', '<leader>r', function()
	telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep fuzzy" })

-- Harpoon
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon" })
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select harpoon 1" })
map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select harpoon 2" })
map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Select harpoon 3" })
map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Select harpoon 4" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<leader>b", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
map("n", "<leader>n", function() harpoon:list():next() end, { desc = "Harpoon next" })

-- Undo Tree
map('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Undo tree" })
