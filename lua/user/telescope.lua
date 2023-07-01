local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
-- local mybuffer = require("user/telescopebuffer")
-- local selection = action_state.get_current_selection()

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next, --doesn't seem to work with both ctrl and alt for some reason but are working for fzf
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close, --changed it from C-c to A-c
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
				-- ["<a-h>"] = "which_key",
				["<a-d>"] = actions.delete_buffer,
			},
			n = {
				["<esc>"] = actions.close,
				-- ["<C-c>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["?"] = actions.which_key,
				["."] = actions.add_selection, -- not working
				-- ["<a-h>"] = "which_key",
				-- ["d"] = delete_buf
				["<a-d>"] = actions.delete_buffer,
				--[[ ['<a-d>'] = require("telescope").mybuffer(), ]]
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		find_files = {

			hidden = true,
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})

-- Settings up extensions
-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hidden = true,
			-- depth = false, -- makes it slow
			-- disables netrw and use telescope-file-browser in its place
			-- hijack_netrw = true,
			hijack_netrw = false, --setting it true will throw and error with neotree while opening a directory so either change neotree netrw option to set this true or set this false
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		http = {
			-- How the mozilla url is opened. By default will be configured based on OS:
			open_url = "xdg-open %s", -- UNIX
			-- open_url = 'open %s' -- OSX
			-- open_url = 'start %s' -- Windows
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			-- find command (defaults to `fd`)
			find_cmd = "rg",
		},
	},
})

-- Telescope file browser
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

require("telescope").load_extension("http")
-- require("telescope").load_extension("media_files")
require('telescope').load_extension('env')
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('luasnip')
require("telescope").load_extension("undo")
require("telescope").load_extension "lazy"
--require('telescope').load_extension('dap')
