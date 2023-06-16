-- local status_ok, lualine = pcall(require, "vim-startify")
-- if not status_ok then
-- 	return
-- end

-- vim.cmd [[let g:startify_session_dir = '~/vimsessions/']]
vim.cmd [[let g:startify_update_oldfiles = 1 ]]   -- Using this option updates it on-the-fly, so that :Startify is always up-to-date.
vim.cmd [[let g:startify_session_persistence = 0]] -- Automatically update sessions in two cases
vim.cmd [[let g:startify_session_delete_buffers = 1]] --Delete all buffers when loading or closing a session
vim.cmd [[let g:startify_change_to_dir = 1]] -- When opening a file or bookmark, change to its directory
vim.cmd [[let g:startify_padding_left = 3]]
-- vim.cmd [[let g:startify_custom_header = startify#fortune#quote()]]
vim.cmd [[let g:startify_custom_header = ['   Neovim'] ]]
vim.cmd [[let g:startify_relative_path = 1]] -- If the file is in or below the current working directory, use a relative path.Otherwise an absolute path is used
vim.cmd [[let g:startify_session_dir = '~/.config/nvim/sessions/']] 

vim.cmd([[
let g:startify_bookmarks = [
      \ {'i' : '~/.config/install.txt'},
      \ {'c' : '~/.config/nvim/init.lua'},
      \ {'p' : '~/.config/polybar/config.ini'},
      \ {'b' : '~/.config/bspwm/bspwmrc'},
      \ {'s' : '~/.config/sxhkd/sxhkdrc'},
      \ {'m' : '~/.local/share/nvim/lazy/tokyonight.nvim/lua/tokyonight/theme.lua'},
      \ {'z' : '~/.config/zsh/.zshrc'},
      \ {'t' : '~/.config/tmux/tmux.conf'},
      \ {'h' : '~/.config/hypr/hyprland.conf'},
      \ {'w' : '~/.config/waybar/config'},
      \ {'d' : '~/.config/doom/config.el'}
      \ ] 
]])

vim.cmd([[
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
]])
--
-- g.startify_enable_special = 0
-- g.startify_session_autoload = 1
-- g.startify_session_delete_buffers = 1
-- g.startify_change_to_vcs_root = 1
-- g.startify_fortune_use_unicode = 1
-- g.startify_session_persistence = 1
-- g:startify_session_dir = '~/vimsessions/' 
-- g:startify_update_oldfiles = 1    -- Using this option updates it on-the-fly, so that :Startify is always up-to-date.
-- g:startify_session_persistence = 1 -- Automatically update sessions in two cases
-- g:startify_session_delete_buffers = 1 --Delete all buffers when loading or closing a session
-- g:startify_change_to_dir = 1 -- When opening a file or bookmark, change to its directory
-- g:startify_padding_left = 3 
-- g:startify_relative_path = 1 -- If the file is in or below the current working directory, use a relative path.Otherwise an absolute path is used 
