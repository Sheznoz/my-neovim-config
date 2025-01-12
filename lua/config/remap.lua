-- Standard custom
vim.keymap.set("n", "<leader>p", vim.cmd.Ex, { desc = "Directory view" })
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy.vim" })
vim.keymap.set("n", "<leader>ss", vim.cmd.w, { desc = "Save" })
vim.keymap.set("n", "<leader>sq", vim.cmd.wq, { desc = "Save & quit" })
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Quit" })

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function() telescope.find_files()  end, { desc = "Fuzzy find" })
vim.keymap.set('n', '<leader>g', function() telescope.git_files() end, { desc = "Git fuzzy find" })
vim.keymap.set('n', '<leader>r', function() 
	telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep fuzzy" })

-- Harpoon
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select harpoon 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select harpoon 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Select harpoon 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Select harpoon 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>b", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end, { desc = "Harpoon next" })

-- Undo Tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Undo tree" })
