return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = true, -- compila colores para mejor rendimiento
				transparent = false,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = theme.ui.bg_pop }, -- fondo de ventanas flotantes
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-dragon") -- también: wave, lotus
		end,
	},
}
