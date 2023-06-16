local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end




-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  -- fg       = '#bbc2cf',
  --[[ bg       = '#0c0c0c', ]]
  --[[ bg       = '#121212', ]]
  bg    = '#16161e';
  --[[ bg       = '#202328', ]]
  fg       = '#51afef',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  -- cyan   = '#b668cd',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue2     = '#51afef',
  blue    = '#519fdf',
  red2     = '#ec5f67',
  red1     = '#ff5189',
  red3    = '#d05c65',
  red =   '#F44747',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    --[[ theme = auto, ]]
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c and lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},

    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Defining style for inactive windows
local function insleft(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

local function insright(component)
  table.insert(config.inactive_sections.lualine_x, component)
end

insleft{
  function()
    -- return '▊'
    return  '███' 
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this

}


-- insleft {
--   -- filesize component
--   'filesize',
--   cond = conditions.buffer_not_empty,
-- }

-- insright { 'location' }
--
-- insright {'progress', color = { fg = colors.fg, gui = 'bold' } }

insleft {
  'filename',
  -- fmt = string.upper,
  cond = conditions.buffer_not_empty,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.red, gui = 'bold' },
}

insright{
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  -- padding = { left = 0, right = 1 }, -- We don't need space before this
  padding = {left = 1 },
}
-- Defining styles for active windows

ins_left {
  function()
    -- return '▊'
    return  '███' 
  end,
  --█ ▇
  color = function()

    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.blue,
      -- v = colors.blue,
      v = colors.cyan,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

-- ins_left {
--   -- mode component
--   function()
--     -- return ''
--     return '' 
--   end,
--   color = function()

--     -- auto change color according to neovims mode
--     local mode_color = {
--       n = colors.red,
--       i = colors.blue,
--       -- v = colors.blue,
--       v = colors.cyan,
--       [''] = colors.blue,
--       V = colors.blue,
--       c = colors.magenta,
--       no = colors.red,
--       s = colors.orange,
--       S = colors.orange,
--       [''] = colors.orange,
--       ic = colors.yellow,
--       R = colors.violet,
--       Rv = colors.violet,
--       cv = colors.red,
--       ce = colors.red,
--       r = colors.cyan,
--       rm = colors.cyan,
--       ['r?'] = colors.cyan,
--       ['!'] = colors.red,
--       t = colors.red,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { right = 1 },
-- }

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
  'filename',
  -- fmt = string.upper,
  cond = conditions.buffer_not_empty,
  cond = conditions.buffer_not_empty,
    
  function()
    -- return ''
    return filename 
  end,
  color = function() 
    local mode_color = {
      -- n = colors.red,
      i = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
}
ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
    
  function()
    -- return ''
    return filesize 
  end,
  color = function() 
    local mode_color = {
      -- n = colors.red,
      i = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
}


ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- ins_left {
--   -- Lsp server name .
--   function()
--     local msg = 'No Active Lsp'
--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = ' LSP:',
--   color = { fg = colors.blue, gui = 'bold' },
-- }

-- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- }

-- ins_right {
--   'vim.v.hlsearch',
--   cond = conditions.buffer_not_empty,
--     
--   function()
--     return vim.v.hlsearch
--   end,
--   color = function() 
--     local mode_color = {
--       -- n = colors.red,
--       i = colors.red,
--     }
--     return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
--   end,
-- }


ins_right {
  'filetype',
  cond = conditions.buffer_not_empty,
    
  function()
    return filetype 
  end,
  color = function() 
    local mode_color = {
      -- n = colors.red,
      i = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
}

ins_right {
  'diff',
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right { 
  'location',
  cond = conditions.buffer_not_empty,
  function()
    return location 
  end,
  color = function() 
    local mode_color = {
      i = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
}


ins_right {
  'progress', 
  cond = conditions.buffer_not_empty,
  function()
    return progress 
  end,
  color = function() 
    local mode_color = {
      -- n = colors.red,
      i = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
}

ins_right {
  function()
    -- return '█'
    -- return '|'
    return  '███'
  end,
  color = function()

    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.blue,
      -- v = colors.blue,
      v = colors.cyan,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  -- padding = { left = 0 },
  padding = { left = 0, right =0 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

   
