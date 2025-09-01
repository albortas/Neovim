-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navegación entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Movimiento de líneas en modo visual
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Búsqueda centrada
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Limpiar highlights
-- Borra el resaltado despues de una busqueda
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Guardar y salir
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Navegacion Explorador de archivos
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts) -- Explorador de archivos

-- Mapeos Bufferline
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>bd", "<cmd>BufferLineCloseOthers<CR>", opts)

-- Telescope (Búsqueda)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
