return {
	-- nvim-cmp - Motor de autocompletado
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Fuente: LSP
			"hrsh7th/cmp-buffer", -- Fuente: buffer actual
			"hrsh7th/cmp-path", -- Fuente: paths del sistema
			"saadparwaiz1/cmp_luasnip", -- Integracion con snippets
			"L3MON4D3/LuaSnip", -- Motor de snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
