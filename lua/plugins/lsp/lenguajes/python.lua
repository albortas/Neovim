local common = require("plugins.lsp.lenguajes.base")
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

-- Configuración adicional específica para Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		-- Configuraciones específicas para archivos Python
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true
		vim.bo.textwidth = 88 -- PEP8

		-- Mapeos específicos para Python
		local bufopts = { noremap = true, silent = true, buffer = true }
		vim.keymap.set("n", "<leader>r", ":!python %<CR>", bufopts)
	end,
})
