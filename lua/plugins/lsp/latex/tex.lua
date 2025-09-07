return {
	-- LSP para LaTeX (texlab)
	{
		"neovim/nvim-lspconfig",
		ft = { "tex", "bib", "cls" }, -- Solo cargar para archivos LaTeX y BibTeX
		config = function()
			local common = require("plugins.lsp.lenguajes.base")
			local lspconfig = require("lspconfig")

			lspconfig.texlab.setup({
				on_attach = common.on_attach,
				capabilities = common.capabilities,
				filetypes = { "tex", "bib", "cls" },
				settings = {
					texlab = {
						build = {
							executable = "tectonic",
							args = { "%f", "--synctex" },
							onSave = true,
							forwardSearchAfter = true,
						},
						forwardSearch = {
							executable = "zathura",
							args = { "--synctex-forward", "%l:1:%f", "%p" },
						},
						chktex = {
							onOpenAndSave = true,
						},
						diagnosticsDelay = 300,
						formatterLineLength = 80,
						bibtexFormatter = "texlab",
						latexFormatter = "latexindent",
						latexindent = {
							modifyLineBreaks = true,
						},
					},
				},
			})
		end,
	},
}
