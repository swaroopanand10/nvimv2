require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd", "tsserver", "pyright", "debugpy", "cssls" },
    automatic_installation = false,
})
  -- Package installation folder
 local install_root_dir = vim.fn.stdpath "data" .. "/mason"

