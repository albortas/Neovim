-- ~/.config/nvim/lua/core/options.lua
local opt = vim.opt

-- Numeros de linea
opt.number = true -- Numeros Absolutos
opt.relativenumber = true -- Numero Relativos

-- Tabs e identacion
opt.tabstop = 2 -- Numero de espacios tabulador
opt.shiftwidth = 2 -- Numero de espacios para indentado automatico
opt.expandtab = true -- Convierte los caracteres de tabulación en el numero de espacios definidos por tabstop
opt.smartindent = true -- Indentación Inteligente

-- Busqueda
opt.hlsearch = false -- Relasaltar los resultados de una busqueda
opt.smartcase = true -- Busqueda sensible a mayusculas y minusculas
opt.ignorecase = true -- Busqueda no es sensible a mayusculas y minusculas

-- Apariencia
opt.termguicolors = true -- Usar colores para teminales modernos
opt.signcolumn = "yes" -- Habilita la columna para mostrar señales

-- Comportamiento
opt.swapfile = false -- Creacion de archivos .swp
opt.backup = false -- Creacion de archivos .bak
opt.undofile = true -- Activa la persistencia del historial de deshacer (undo)
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- directorio donde se guardara (undo)
opt.updatetime = 50 -- Tiempo en milisegundos para gurdar una instantanea undo
opt.timeoutlen = 300 -- Tiempo de mapeo de teclas paciales

-- Dividir ventanas
opt.splitright = true -- Creacion de nuevas ventana a la derecha
opt.splitbelow = true -- Creacion de la ventana abajo

-- Misceláneo
opt.mouse = "a" -- Hbilitar mouse en todos los modos de nvim
opt.wrap = false -- Habilitar el ajuste de linea, significa que lineas largas no se moveran a la siguiente linea
opt.breakindent = true -- Funciona con el anterior, para indentación a lineas envueltas
opt.cursorline = true -- Resalta la linea actual donde se encuentra el cursor
opt.clipboard = "unnamedplus" -- Permite copiar y pegar entre Neovim y otras aplicaciones
