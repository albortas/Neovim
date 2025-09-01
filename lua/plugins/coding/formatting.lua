return {
	-- Conform - Formateo automático al guardar
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black", "isort" },
					rust = { "rustfmt" },
					tex = { "latexindent" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				-- Opcional: Configura formateadores especificos
				formatters = {
					rustfmt = {
						command = vim.fn.exepath("rustfmt"),
						args = { "--edition", "2021" },
					},
					isort = {
						command = "isort",
						args = { "--profile", "black", "-" },
					},
				},
			})
		end,
	},
}
