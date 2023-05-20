require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = true, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
  routes = {
    {
      view = "split",
      filter = { event = "msg_show", min_height = 20 },
    },
  },
})

-- Lsp Hover Doc Scrolling
vim.keymap.set({ "n", "i", "s" }, "<c-n>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-n>"
	end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-p>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-p>"
	end
end, { silent = true, expr = true })
