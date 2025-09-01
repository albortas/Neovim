return {
	-- Corregir automáticamente ortografía en comentarios
	{
		"lewis6991/spellsitter.nvim",
		ft = { "tex" },
		config = function()
			require("spellsitter").setup()
		end,
	},
}
