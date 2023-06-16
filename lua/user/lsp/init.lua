require("mason").setup()
require("mason-lspconfig").setup{

 ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright", "bashls", "tsserver", "jsonls", "html","emmet_ls","cssls"},

}

require("user.lsp.lspconfig")
require("user.lsp.lspkey")

require("mason-null-ls").setup({
    automatic_setup = true,
    ensure_installed = {"stylua","shfmt","black","flake8","prettier"},
})
require("user.lsp.nullls")
require("user.lsp.lspsaga")
require("user.lsp.dap")
require("user.lsp.dap-virtual-text")
