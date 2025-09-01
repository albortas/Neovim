return {
	-- Explorador de archivos
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false, -- Oculta los archivos que inician con .
				},
				actions = {
					open_file = {
						quit_on_open = true, -- Cierra NvimTree al abrir un archivo
					},
				},
			})
		end,
	},
}
