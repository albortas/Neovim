return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = {
					light = "latte",
					dark = "mocha",
				},
				integrations = {
					cmp = true,
					nvimtree = true,
					telescope = true,
					notify = false,
					mini = false,
					-- etc. Puedes activar integraciones específicas
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
