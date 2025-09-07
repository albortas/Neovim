return {
	-- Sintaxis y highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"markdown",
				},
				ignore_install = { "latex" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						return lang == { "tex", "bib", "cls" } -- Deshabilitar treesitter para LaTex
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					disable = { "tex", "bib" },
				},
			})
		end,
	},
}
