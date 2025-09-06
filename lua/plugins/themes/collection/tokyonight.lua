return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- cargar siempre
		priority = 1000, -- cargar primero
		config = function()
			require("tokyonight").setup({
				style = "storm", -- opciones: "storm", "night", "day"
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { bold = true },
				},
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
