-- vim.cmd.colorscheme("tokyonight")

-- Tokyonight
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  -- transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme

  on_highlights = function(highlights, colors) 
     highlights.PrePoc={
       fg = "#FF3F4F",
       style = "bold"
     }

     highlights.Include={
       fg = "#FF3F4F",
       style = "bold"

     }

     highlights.Define={
       fg = "#FF3F4F",
       style = "bold"
     }

     highlights.Function={
       fg = "#7aa2f7",
       -- fg = "#F8C056",
       -- fg = "#ff0000",
       -- fg = "#FF3F4F",
       -- fg = "#52b0ef",
       -- fg = "#ff007c",
       -- fg = "#d7827e",
       -- style = "italic, bold"
       bold = true;
       italic = true;
     }

     -- highlights.Type={
     --   fg= "#FAB387",
     -- }

     -- highlights.TSType={
     --   fg= "#FAB387",
     -- }

     -- highlights.TSTypeBuiltin={
     --   fg= "#FAB387",
     -- }
     highlights.Comment={
       fg= "#6C7086",
     }

  end,
})

vim.cmd.colorscheme("tokyonight-night")

-- vim.cmd('colorscheme rose-pine')


require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'auto',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	-- disable_background = true,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
		-- EndOfBuffer = { fg = 'bg', },
		EndOfBuffer = { fg = '#000000', },
		Include = { fg = '#FF3F4F', bold = true, italic = true },
		Define = { fg = '#FF3F4F',  bold = true,italic = true },
		PrePoc = { fg = '#FF3F4F', bold = true, italic = true},
		Statement = { fg = '#52b0ef'},
		Repeat = { fg = '#52b0ef'},
		Conditional = { fg = '#52b0ef'},
		Label = { fg = '#52b0ef'},
		-- keyword = { fg = '#52b0ef'},
		keyword = { fg = '#9d7cd8'},
		-- Identfier = { fg = '#ffffff'},
		-- Type = { fg = '#df8e1d'},
		-- -- Typedef = { fg = '#df8e1d'},
		-- -- Type = { fg = '#fca7ea'},
		-- String = { fg = '#9ece6a'},
		-- Structure = { fg = '#df8e1d'},
		-- -- StorageClass = { fg = '#9ece6a'},
  --   Comment = {fg= "#6C7086",};
  --   Search = {bg= "#7aa2f7", fg = "#000000"};

    
	}
})


require("dracula").setup({
  colors={
  },
  transparent_bg=true,
  italic_comment = true,
  overrides={
    -- Normal = { bg = "#000000"},
  }
})
-- vim.cmd[[colorscheme dracula]]

-- Set colorscheme after options
-- vim.cmd('colorscheme rose-pine')

-- vim.cmd [[
-- try
--   colorscheme tokyonight-night
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- vim.cmd([[
-- let g:aurora_italic = 1     
-- let g:aurora_transparent = 1     
-- let g:aurora_bold = 1     
-- let g:aurora_darker = 1     
-- colorscheme aurora
-- hi! EndOfBuffer guibg=#000000 guifg=#000000 ctermbg=0 ctermfg=0
-- ]])

