local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	--[[ debug = false, ]]
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		--[[ formatting.black.with({ extra_args = { "--fast" } }), ]]
		formatting.black,
		formatting.stylua,
		diagnostics.flake8,
    --[[ formatting.autopep8, ]]
    --[[ diagnostics.eslint_d, ]]
	},
})

--[[ local null_ls = require 'null-ls' ]]
--[[]]
--[[ require ('mason-null-ls').setup({ ]]
--[[     ensure_installed = {'stylua', 'jq', 'flake8'} ]]
--[[ }) ]]
--[[]]
--[[ require 'mason-null-ls'.setup_handlers { ]]
--[[     function(source_name) ]]
--[[       -- all sources with no handler get passed here ]]
--[[     end, ]]
--[[]]
--[[     stylua = function() ]]
--[[       null_ls.register(null_ls.builtins.formatting.stylua) ]]
--[[     end, ]]
--[[]]
--[[     jq = function() ]]
--[[       null_ls.register(null_ls.builtins.formatting.jq) ]]
--[[     end, ]]
--[[]]
--[[     flake8 = function() ]]
--[[       null_ls.register(null_ls.builtins.formatting.flake8) ]]
--[[     end, ]]
--[[]]
--[[     prettier = function() ]]
--[[       null_ls.register(null_ls.builtins.formatting.prettier) ]]
--[[     end, ]]
--[[      ]]
--[[     black = function() ]]
--[[       null_ls.register(null_ls.builtins.formatting.black) ]]
--[[     end, ]]
--[[]]
--[[     pylint = function() ]]
--[[       null_ls.register(null_ls.builtins.formatting.pylint) ]]
--[[     end, ]]
--[[ } ]]
--[[]]
--[[  --will setup any installed and configured sources above ]]
--[[ null_ls.setup() ]]
