local lsplist = { "lua_ls", "astro", "biome", "bashls", "ts_ls", "tailwindcss", "typos_lsp" }
require("mason").setup()

require("mason-lspconfig").setup {
	ensure_installed = lsplist,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").typos_lsp.setup { capabilities = capabilities, filetypes = { "markdown" } }
require("lspconfig").biome.setup { capabilities = capabilities }
require("lspconfig").astro.setup { capabilities = capabilities }
require("lspconfig").bashls.setup { capabilities = capabilities }
require("lspconfig").ts_ls.setup { capabilities = capabilities }
require("lspconfig").markdown_oxide.setup { capabilities = capabilities }
require("lspconfig").tailwindcss.setup { capabilities = capabilities, filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" } }

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
