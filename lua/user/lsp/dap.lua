require("mason-nvim-dap").setup({
    ensure_installed = { "python", "js-debug" },
    -- handlers = {}, -- sets up dap in the predefined manner
})
require('nvim-dap-repl-highlights').setup()

require('user.lsp.dap-config.node')
require('user.lsp.dap-config.c-cpp-rust')
-- require('user.lsp.dap-config.rust-tools')









