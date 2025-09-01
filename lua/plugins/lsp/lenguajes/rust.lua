local common = require("plugins.lsp.lenguajes.base")
local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

-- Configuración adicional específica para Rust
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		-- Configuraciones específicas para archivos Rust
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true

		-- Mapeos específicos para Rust
		local bufopts = { noremap = true, silent = true, buffer = true }
		vim.keymap.set("n", "<leader>rr", ":!cargo run<CR>", bufopts)
		vim.keymap.set("n", "<leader>rb", ":!cargo build<CR>", bufopts)
		vim.keymap.set("n", "<leader>rt", ":!cargo test<CR>", bufopts)
	end,
})
