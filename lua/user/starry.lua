local starry = require 'starry'
local colors = require 'starry.colors'

starry.setup{
}
vim.g.starry_italic_comments = true
vim.g.starry_italic_string = false
vim.g.starry_italic_keywords = false
vim.g.starry_italic_functions = false
vim.g.starry_italic_variables = false
vim.g.starry_contrast = true
vim.g.starry_borders = false
vim.g.starry_disable_background = true  --set to true to disable background and allow transparent background
-- vim.g.starry_style_fix=v:true  --disable random loading
vim.g.starry_style="moonlight"  --load moonlight everytime or
vim.g.starry_darker_contrast=true  --"darker background
vim.g.starry_deep_black=false       --"OLED deep black
vim.g.starry_italic_keywords=false
vim.g.starry_italic_functions=false
vim.g.starry_set_hl=false --" Note: enable for nvim 0.6+, it is faster (loading time down to 4~6s from 7~11s), but it does
-- not overwrite old values and may has some side effects
vim.g.starry_daylight_switch=false  --"this allow using brighter color
--" other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
vim.cmd('colorscheme middlenight_blue')

vim.cmd[[hi! EndOfBuffer guibg=#000000 guifg=#000000 ]] -- this is for disappearing tilde sign
