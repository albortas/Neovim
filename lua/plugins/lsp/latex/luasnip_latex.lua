return {
	-- Snippets para LaTeX
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		dependencies = { "L3MON4D3/LuaSnip" },
		ft = { "tex" },
		config = function()
			require("luasnip-latex-snippets").setup()
		end,
	},
}
