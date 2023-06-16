local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- havent setup the on_attach and capabilities given by lspconfig because no idea what features it adds since everything is working fine without it

-- setting up language
local lspconfig = require('lspconfig')
lspconfig.pyright.setup { capabilities = capabilities }
lspconfig.lua_ls.setup { capabilities = capabilities }
lspconfig.tsserver.setup { capabilities = capabilities }
lspconfig.clangd.setup { capabilities = capabilities }
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {},
  },
}

lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.html.setup { capabilities = capabilities }
lspconfig.bashls.setup { capabilities = capabilities }
lspconfig.jsonls.setup { capabilities = capabilities }
lspconfig.emmet_ls.setup { capabilities = capabilities }


