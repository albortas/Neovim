return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard" -- "soft", "medium", "hard" (oscuro) o "light"
			vim.cmd("colorscheme everforest")
		end,
	},
}
