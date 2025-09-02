return {
	-- Sintaxis y highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"markdown",
				},
				ignore_install = { "latex" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						return lang == { "tex", "bib" } -- Deshabilitar treesitter para LaTex
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					disable = { "tex", "bib" },
				},
			})
		end,
	},

	-- Syntax highlighting mejorado para LaTeX
	{
		"lervag/vimtex",
		ft = { "tex", "bib" },
		config = function()
			-- Deshabilitar tree-sitter para VimTeX
			vim.g.vimtex_matchparen_enabled = 0

			-- Configuracion básica
			vim.g.vimtex_view_method = "okular" --okular
			vim.g.vimtex_compiler_method = "tectonic"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_syntax_conceal = {
				accents = 0,
				ligatures = 0,
				cites = 0,
				fancy = 0,
				spacing = 0,
				greek = 0,
				math_bounds = 0,
				math_delimiters = 0,
				math_fracs = 0,
				math_super_sub = 0,
				math_symbols = 0,
				sections = 0,
				styles = 0,
			}

			-- Mapeos específicos para VimTeX
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function()
					local bufopts = { noremap = true, silent = true, buffer = true }

					-- Compilar
					vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", bufopts)
					vim.keymap.set("n", "<leader>lL", "<cmd>VimtexCompileSS<cr>", bufopts)
					vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<cr>", bufopts)
					vim.keymap.set("n", "<leader>lK", "<cmd>VimtexStopAll<cr>", bufopts)

					-- Visualizar
					vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", bufopts)

					-- Limpiar archivos auxiliares
					vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", bufopts)

					-- Búsqueda inversa (from PDF to source)
					vim.keymap.set("n", "<leader>lr", "<cmd>VimtexReverseSearch<cr>", bufopts)

					-- Toggle del modo de conceal
					vim.keymap.set("n", "<leader>lx", "<cmd>VimtexToggleConceal<cr>", bufopts)
				end,
			})
		end,
	},
}
