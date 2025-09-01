local common = require('plugins.lsp.lenguajes.base')
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }, -- Reconocer vim como global
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          -- Agregar más rutas si es necesario para tus proyectos
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Configuración adicional específica para Lua
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    -- Configuraciones específicas para archivos Lua
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end
})
