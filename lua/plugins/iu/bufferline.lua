return {
	-- Configuración de bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				-- Opciones visuales
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp", -- Muestra errores y advertencias del LSP
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				show_buffer_close_icons = false, -- No muestra la 'x' para cerrar
				show_close_icon = false,
				--mode = "buffers",
				separator_style = "slope", -- Estilo de los separadores entre pestañas
				color_icons = true,
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	},
}
