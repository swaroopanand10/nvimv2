local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["A"] = { "<cmd>Startify<cr>", "Startify" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	--[[ ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, ]]
	["e"] = { "<cmd>NeoTreeRevealToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["i"] = { "<cmd>wq!<CR>", "Save+Quit" },
	["z"] = { "<cmd>wqa!<CR>", "Save+Quit+all" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["Q"] = { "<cmd>qa!<CR>", "Quit all without saving" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	-- ["f"] = {
	--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	--   "Find files",
	-- },
	-- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	["o"] = { "<cmd>FZF! --layout=reverse ~<cr>", "fzf_file" },
	-- ['o'] = { "<cmd>FzfLua files cwd=~<cr> --preview-window=hidden<cr>", "fzf_file_prv" },
	["j"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["u"] = { "<cmd>:lcd %:p:h<cr>", "path_to_file" },
	["W"] = { "<cmd>:set wrap!<cr>", "wrap" },
	["D"] = { "<cmd>%d<cr>", "clear buffer" },
	a = {
		name = "startify",
		s = { "<cmd>SSave!<cr>", "Save session" }, -- save a session without asking
		l = { "<cmd>SLoad<cr>", "Load session" },
		c = { "<cmd>SClose<cr>", "Close session" },
		d = { "<cmd>SDelete<cr>", "Delete session" },
		D = { "<cmd>StartifyDebug<cr>", "Startify Debug" },
	},
	-- k = {
	-- 	name = "fzf_grep",
	-- 	a = { "<cmd>Files! ~<cr>", "fzf_file_prv" },
	-- 	r = { "<cmd>Lines!<cr>", "buffer_grep" },
	-- 	f = { "<cmd>Rg!<cr>", "normal_grep" },
	-- 	d = { "<cmd>History!: <cr>", "history" },
	-- 	c = { "<cmd>Commands! <cr>", "commands" },
	-- },
	k = {
		name = "fzf_grep",
		F = { "<cmd>FzfLua<cr>", "fzf_lua" },
		a = { "<cmd>FzfLua files cwd=~<cr>", "files_in_~_prev" },
		r = { "<cmd>FzfLua lgrep_curbuf<cr>", "buffer_grep" },
		v = { "<cmd>FzfLua grep_visual<cr>", "visual_grep" },
		f = { "<cmd>FzfLua live_grep<cr>", "normal_grep" },
		p = { "<cmd>FzfLua files<cr>", "files_in_._prev" },
		b = { "<cmd>FzfLua buffers<cr>", "buffers" },
		-- d = { "<cmd>FzfLua command_history<cr>", "command history" },
	},
	f = {
		name = "telescope",
		-- f = {
		--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		--   "Find files",
		-- },
		t = { "<cmd>Telescope <cr>", "telescope" },
		g = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		b = { "<cmd>:Telescope file_browser<cr>", "file_browser" },
		r = { "<cmd>:Telescope registers<cr>", "registers" },
		c = { "<cmd>:Telescope commands<cr>", "commands" },
		h = { "<cmd>:Telescope command_history<cr>", "commands history" },
		o = { "<cmd>:Telescope oldfiles<cr>", "old files" },
		s = { "<cmd>:Telescope grep_string<cr>", "grep string" },
	},
	d = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
	},
	--[[ p = { ]]
	--[[   name = "Packer", ]]
	--[[   c = { "<cmd>PackerCompile<cr>", "Compile" }, ]]
	--[[   i = { "<cmd>PackerInstall<cr>", "Install" }, ]]
	--[[   s = { "<cmd>PackerSync<cr>", "Sync" }, ]]
	--[[   S = { "<cmd>PackerStatus<cr>", "Status" }, ]]
	--[[   u = { "<cmd>PackerUpdate<cr>", "Update" }, ]]
	--[[ }, ]]

	p = {
		name = "lazyvim",
		c = { "<cmd>Lazy clean<cr>", "clean" },
		s = { "<cmd>Lazy sync<cr>", "Sync" },
		l = { "<cmd>Lazy<cr>", "lazy" },
	},
	g = {
		name = "Git",
		-- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },-- lazygit was not working at all
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
		"<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format {async=true}<cr>", "Format" },
		-- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" }, -- this option is depriciated so I changed it
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		-- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },  -- another rename functionality in the handlers.lua file by increname
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		m = {
			"<cmd>Mason<cr>",
			"mason",
		},
		g = {
			"<cmd>lua vim.diagnostic.open_float()<CR>",
			"diagnostic",
		},
		n = {
			"<cmd>NullLsInfo<cr>",
			"null-ls info",
		},
		h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature_help" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		--[[ s = { 'function() require("ssr").open() end', "ssr" }, ]]
	},
	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	v = {
		name = "splits",
		v = { "<cmd>vsplit<cr>", "vertical split" },
		h = { "<cmd>split<cr>", "horizontal split" },
		s = { "<C-w>r", "swap" },
		e = { "<C-w>=", "swap" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
