vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd [[colorscheme nightfly]]
require('mini.icons').setup()
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.expandtab = true
vim.opt.fillchars = 'eob: '
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.o.wrap = true

-- Neotree
require("neo-tree").setup({
	window = {
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["Z"] = "expand_all_nodes",
		},
	},
	filesystem = {
		components = {
			harpoon_index = function(config, node, _)
				local harpoon_list = require("harpoon"):list()
				local path = node:get_id()
				local harpoon_key = vim.uv.cwd()

				for i, item in ipairs(harpoon_list.items) do
					local value = item.value
					if string.sub(item.value, 1, 1) ~= "/" then
						value = harpoon_key .. "/" .. item.value
					end

					if value == path then
						vim.print(path)
						return {
							text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
							highlight = config.highlight,
						}
					end
				end
				return {}
			end,
		},
		renderers = {
			file = {
				{ "icon" },
				{ "name",         use_git_status_colors = true },
				{ "harpoon_index" }, --> This is what actually adds the component in where you want it
				{ "diagnostics" },
				{ "git_status",   highlight = "NeoTreeDimText" },
			},
		},
		follow_current_file = {
			enabled = true,
		},
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = false,
	},
})

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup {}


-- Cybu
require("cybu").setup({
	position = {
		relative_to = "win", -- win, editor, cursor
		anchor = "topcenter", -- topleft, topcenter, topright,
		-- centerleft, center, centerright,
		-- bottomleft, bottomcenter, bottomright
		vertical_offset = 10, -- vertical offset from anchor in lines
		horizontal_offset = 0, -- vertical offset from anchor in columns
		max_win_height = 5, -- height of cybu window in lines
		max_win_width = 0.5, -- integer for absolute in columns
		-- float for relative to win/editor width
	},
	style = {
		path = "relative", -- absolute, relative, tail (filename only),
		-- tail_dir (filename & parent dir)
		path_abbreviation = "none", -- none, shortened
		border = "rounded", -- single, double, rounded, none
		separator = " ", -- string used as separator
		prefix = "…", -- string used as prefix for truncated paths
		padding = 1, -- left & right padding in number of spaces
		hide_buffer_id = true, -- hide buffer IDs in window
		devicons = {
			enabled = true, -- enable or disable web dev icons
			colored = true, -- enable color for web dev icons
			truncate = true, -- truncate wide icons to one char width
		},
		highlights = { -- see highlights via :highlight
			current_buffer = "MatchParen", -- current / selected buffer
			adjacent_buffers = "CybuAdjacent", -- buffers not in focus
			background = "Pmenu", -- window background
			border = "TablineSel", -- border of the window
		},
	},
	behavior = { -- set behavior for different modes
		mode = {
			default = {
				switch = "immediate", -- immediate, on_close
				view = "rolling", -- paging, rolling
			},
			last_used = {
				switch = "immediate", -- immediate, on_close
				view = "rolling", -- paging, rolling
			},
			auto = {
				view = "rolling", -- paging, rolling
			},
		},
		show_on_autocmd = false, -- event to trigger cybu (eg. "BufEnter")
	},
	display_time = 650,    -- time the cybu window is displayed
	exclude = {            -- filetypes, cybu will not be active
		"neo-tree",
		"fugitive",
		"qf",
	},
	filter = {
		unlisted = true,    -- filter & fallback for unlisted buffers
	},
	fallback = function() end, -- arbitrary fallback function
	-- used in excluded filetypes
})
