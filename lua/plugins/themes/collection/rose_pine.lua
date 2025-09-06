return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,

				-- Cambia estos colores para personalizar
				colors = {
					base = "#191724",
					surface = "#1f1d2e",
				},
			})
			vim.cmd("colorscheme rose-pine-moon") -- o "rose-pine", "rose-pine-dawn"
		end,
	},
}
