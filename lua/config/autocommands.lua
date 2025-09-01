local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Grupo para autocomandos generales
local general_group = augroup("GeneralSettings", { clear = true })

-- Limpiar espacios en blanco al final al guardar
autocmd("BufWritePre", {
	group = general_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Resaltar texto yankado (copiado)
autocmd("TextYankPost", {
	group = general_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Autoformateo para ciertos tipos de archivos (opcional)
autocmd("BufWritePre", {
	group = general_group,
	pattern = {
		"*.lua",
		"*.py",
		--"*.js",
		--"*.ts",
		"*.json",
	},
	callback = function()
		vim.lsp.buf.format()
	end,
})
