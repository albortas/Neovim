return {
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").set()
			vim.cmd("colorscheme nord")
		end,
	},
}
