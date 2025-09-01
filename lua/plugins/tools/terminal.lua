return {
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		enabled = true,
		config = function()
			require("toggleterm").setup()
		end,
	},
}
