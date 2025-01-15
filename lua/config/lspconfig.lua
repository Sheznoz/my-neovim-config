local lsplist = { "lua_ls", "astro", "biome" }
require("mason").setup()

require("mason-lspconfig").setup {
	ensure_installed = lsplist,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").biome.setup {}
require("lspconfig").astro.setup { capabilities = capabilities }

local prettier = require("prettier")

prettier.setup({
	bin = 'prettier',
	filetypes = {
		"css",
		"astro",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})

-- Format on save autocmd
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
			end,
		})
	end
})
