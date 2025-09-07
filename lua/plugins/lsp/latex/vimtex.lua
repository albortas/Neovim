return {
	-- Syntax highlighting mejorado para LaTeX
	{
		"lervag/vimtex",
		ft = { "tex", "bib", "cls" },
		config = function()
			-- Metodo de visualizacion (ajusta según tu sistema)
			vim.g.vimtex_view_method = "zathura" --tambien: "okular", "skim", "mupdf", etc.

			-- Usar latexmk como compilador
			vim.g.vimtex_compiler_method = "latexmk"

			-- Opciones de latexmk (personalizable)
			vim.g.vimtex_compiler_latexmk = {
				callback = 1,
				cont = 1, -- modo continuo (live preview)
				options = {
					"-pdf", -- genera PDF
					"-interaction=nonstopmode",
					"-file-line-error",
					"-synctex=1", -- para sincronizacion inversa
					"-shell-escape", -- si usas minted, tikz, etc.
				},
			}

			-- Quickfix
			vim.g.vimtex_quickfix_mode = 0 -- 0 = no abre automaticamente
			vim.g.vintex_quickfix_open_on_warning = 1

			-- Activa el sistema de "conceal" en Neovim
			vim.o.conceallevel = 2
			vim.o.concealcursor = "nvc" -- muestra los simbolos ocultos en modo normal, visual, commando

			-- Syntax conceal
			vim.g.vimtex_syntax_conceal = {
				accents = 1, -- ü → ü (mejor legibilidad)
				ligatures = 1, -- `` → “, '' → ”, -- → –, etc.
				cites = 1, -- \cite{key} → [1] (si ya se compiló)
				fancy = 0, -- \emph{texto} → *texto* en cursiva (si la fuente lo permite)
				spacing = 1, -- ~ → espacio no separable (muestra un punto o espacio fino)
				greek = 1, -- \alpha → α, \beta → β, etc.
				math_bounds = 1, -- _ y ^ se ven como sub/superíndice (pequeños)
				math_delimiters = 1, -- \(, \[ → se ven como $, $$ (o se ocultan)
				math_fracs = 1, -- \frac{a}{b} → se ve como fracción vertical (a/b más bonito)
				math_super_sub = 1, -- a^2 → a² (superíndice real)
				math_symbols = 1, -- \to → →, \in → ∈, \approx → ≈, etc.
				sections = 1, -- \section{Intro} → § Intro
				styles = 1, -- \textbf{texto} → texto en negrita (si el tema lo permite)
			}

			-- Configuracion mejorada para archivos de clase
			-- Commandos personalizados para clases y paquetes
			vim.g.vimtex_syntax_custom_cmds = {
				{
					name = "Class",
					pattern = "\\ProvidesClass{",
					cmd = "texDocClass",
				},
				{
					name = "Package",
					pattern = "\\ProvidesPackage{",
					cmd = "texDocPackage",
				},
			}

			-- Mapeos específicos para VimTeX
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function()
					local bufopts = { noremap = true, silent = true, buffer = true }

					-- Compilar
					vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", bufopts)
					vim.keymap.set("n", "<leader>lL", "<cmd>VimtexCompileSS<cr>", bufopts) --sin modo continuo
					vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<cr>", bufopts)
					vim.keymap.set("n", "<leader>lK", "<cmd>VimtexStopAll<cr>", bufopts)

					-- Visualizar
					vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", bufopts)

					-- Limpiar archivos auxiliares
					vim.keymap.set("n", "<leader>la", "<cmd>VimtexClean<cr>", bufopts)

					-- Búsqueda inversa (from PDF to source)
					vim.keymap.set("n", "<leader>lr", "<cmd>VimtexReverseSearch<cr>", bufopts)

					-- Toggle del modo de conceal
					vim.keymap.set("n", "<leader>lc", function()
						local conceal_enabled = vim.g.vimtex_syntax_conceal_enabled == 1
						if conceal_enabled then
							vim.cmd("VimtexToggleConceal")
							vim.notify("Conceal: OFF", vim.log.levels.INFO, { title = "vimtex" })
						else
							vim.cmd("VimtexToggleConceal")
							vim.notify("Conceal: ON", vim.log.levels.INFO, { title = "vimtex" })
						end
					end, bufopts)
					-- Mostrar informacion del documento
					vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<cr>", bufopts)
				end,
			})
		end,
	},
}
