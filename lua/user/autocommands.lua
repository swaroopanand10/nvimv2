vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]


vim.cmd([[autocmd BufEnter *.pdf execute "silent !zathura '%'" | Bdelete ]]) 
--  vim.cmd("autocmd BufEnter *.jpg,*.jpeg,*png !sxiv '%'") 
-- vim.cmd([[autocmd BufEnter *.jpg,*jpeg,*png execute "silent !sxiv '%'" | Bdelete ]]) 



--[[ vim.cmd("autocmd BufEnter *.jpeg !sxiv '%'") ]]
--[[ vim.cmd("autocmd BufEnter *.png !sxiv '%'") ]]
-- vim.api.nvim_create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd [[
--       set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
--     ]]
--   end,
-- })
--
