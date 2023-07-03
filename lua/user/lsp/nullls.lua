local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("mason-null-ls").setup({
    automatic_setup = true,
    ensure_installed = {"stylua","shfmt","black","flake8","prettier","cpplint"},
})

null_ls.setup({
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    --[[ formatting.black.with({ extra_args = { "--fast" } }), ]]
    formatting.black,
    formatting.stylua,
    diagnostics.flake8,
    -- diagnostics.cpplint,
    -- diagnostics.eslint_d,
    -- null_ls.builtins.formatting.shfmt,
    -- null_ls.builtins.diagnostics.shfmt,
  },
})
