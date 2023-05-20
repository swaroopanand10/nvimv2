local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
--[[ M.capabilities = vim.lsp.protocol.make_server_capabilities() ]]
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- local function lsp_highlight_document(client)
--   -- Set autocommands conditional on server_capabilities
--   if client.server_capabilities.document_highlight then
--     vim.api.nvim_exec(
--       [[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
--       false
--     )
--   end
-- end

local function lsp_highlight_document(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

--[[ Setting keybindings ]]
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "<leader>lr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
-- vim.keymap.set("n", "<leader>rn", ":IncRename ")

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- border= rounded was not working so i removed it ]]
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) ]]
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) --I changed it form <C-k> to <C-s> becuase of collision
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts) ]]
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gL", '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- border= rounded was not working so i removed it ]]
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts) ]]
	-- '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts) ]]
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- I edited this because it was clashing with quit shortcut
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- edited it bcz it exists in whichkey and it was also clashing with quit shortcut
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format {async = true}' ]])
	-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]] -- option depcreciated
end

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

-- all these functions below are just for navic attach which is already being done below in navic attach function except for rust
-- require("lspconfig").clangd.setup {
--   on_attach = on_attach,
-- }

-- require("lspconfig").pyright.setup {
--   on_attach = on_attach
--   -- on_attach = function(client, bufnr)
--   --   require "lsp_signature".on_attach(signature_setup, bufnr)  -- Note: add in lsp client on-attach
--   -- end,
-- }

-- require("lspconfig").sumneko_lua.setup {
--   on_attach = on_attach
-- }

-- require("lspconfig").lua_ls.setup {
--   on_attach = on_attach
-- }

-- require("lspconfig").tsserver.setup {
--   on_attach = on_attach
-- }

-- require("lspconfig").bashls.setup {
--   on_attach = on_attach
-- }

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
})

--[[below code make the tsserver lsp working but I don't know how]]
local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		print("navic")
		return
	end
	navic.attach(client, bufnr)
end

local function lsp_signature(client, bufnr)
	require("lsp_signature").on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	attach_navic(client, bufnr)
	-- lsp_signature(client,bufnr) --removed it because confilicting noice.nvim

	-- if client.name == "tsserver" then
	--   require("lsp-inlayhints").on_attach(client, bufnr)
	-- end

	if client.name == "jdt.ls" then
		vim.lsp.codelens.refresh()
		if JAVA_DAP_ACTIVE then
			require("jdtls").setup_dap({ hotcodereplace = "auto" })
			require("jdtls.dap").setup_dap_main_class_configs()
		end
	end
end

--depcreciated
-- M.on_attach = function(client, bufnr)
--   if client.name == "tsserver" then
--     client.resolved_capabilities.document_formatting = false
--   end
--   lsp_keymaps(bufnr)
--   lsp_highlight_document(client)
-- end

--[[ M.on_attach = function(client, bufnr) ]]
--[[   if client.name == "tsserver" then ]]
--[[     client.server_capabilities.document_formatting = false ]]
--[[   end ]]
--[[   lsp_keymaps(bufnr) ]]
--[[   lsp_highlight_document(client) ]]
--[[ end ]]
-- local capabilities = vim.lsp.protocol.make_server_capabilities()

-- local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then
--   return
-- end
-- --[[ --[[ M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities) ]] -- depcreciated ]]
-- M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
