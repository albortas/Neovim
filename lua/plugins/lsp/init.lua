return {
	-- LSP Manager
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_uninstalled = "✗",
					package_pending = "⟳",
				},
			},
		},
		config = function()
			require("mason").setup()
		end,
	},

	-- Configuración LSP
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				-- Lista de servidores de lenguaje que deseas instalar y configurar
				ensure_installed = {
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"texlab",
					-- Agregar más LSPs aqui
				},
				automatic_installation = true, -- Instala automaticamente los servidores
			})
		end,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Cargar configuración base
			require("plugins.lsp.lenguajes.base")

			-- Cargar configuraciones especificas de cada lenguaje
			require("plugins.lsp.lenguajes.lua")
			require("plugins.lsp.lenguajes.python")
			require("plugins.lsp.lenguajes.rust")
		end,
	},

	require("plugins.lsp.lang.tex"),
}
