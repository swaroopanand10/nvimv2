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

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end


-- Winbar stuff
if vim.fn.has "nvim-0.8" == 1 then
  vim.api.nvim_create_autocmd(
    { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    {
      callback = function()
        require("user.winbar").get_winbar()
        --[[ print("working"); ]]
      end,
    }
  )
end


vim.cmd([[autocmd BufEnter *.pdf execute "silent !zathura '%'" | Bdelete ]]) 
--[[ vim.cmd("autocmd BufEnter *.jpg,*.jpeg,*png !sxiv '%'") ]]
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
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "Jaq", "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "DressingSelect", "tsplayground" },
--   callback = function()
--     vim.cmd [[
--       nnoremap <silent> <buffer> q :close<CR> 
--       set nobuflisted 
--     ]]
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "Jaq" },
--   callback = function()
--     vim.cmd [[
--       nnoremap <silent> <buffer> <m-r> :close<CR>
--       " nnoremap <silent> <buffer> <m-r> <NOP> 
--       set nobuflisted 
--     ]]
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "" },
--   callback = function()
--     local buf_ft = vim.bo.filetype
--     if buf_ft == "" or buf_ft == nil then
--       vim.cmd [[
--       nnoremap <silent> <buffer> q :close<CR> 
--       nnoremap <silent> <buffer> <c-j> j<CR> 
--       nnoremap <silent> <buffer> <c-k> k<CR> 
--       set nobuflisted 
--     ]]
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "term://*" },
--   callback = function()
--     vim.cmd "startinsert!"
--     -- TODO: if java = 2
--     vim.cmd "set cmdheight=1"
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "lir" },
--   callback = function()
--     vim.opt_local.number = false
--     vim.opt_local.relativenumber = false
--   end,
-- })
--
-- vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
-- -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- --   callback = function()
-- --     vim.cmd [[
-- --       if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- --     ]]
-- --   end,
-- -- })
--
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd "tabdo wincmd ="
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
--   callback = function()
--     vim.cmd "quit"
--   end,
-- })
--
-- -- require("user.winbar").get_winbar()
--
-- if vim.fn.has "nvim-0.8" == 1 then
--   vim.api.nvim_create_autocmd(
--     { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
--     {
--       callback = function()
--         require("user.winbar").get_winbar()
--       end,
--     }
--   )
-- end
-- -- require "user.winbar"
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   callback = function()
--     vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.java" },
--   callback = function()
--     vim.lsp.codelens.refresh()
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   callback = function()
--     vim.cmd "hi link illuminatedWord LspReferenceText"
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.cmd "checktime"
--   end,
-- })
--
-- -- vim.api.nvim_create_autocmd({ "ModeChanged" }, {
-- --   callback = function()
-- --     local luasnip = require "luasnip"
-- --     if luasnip.expand_or_jumpable() then
-- --       -- ask maintainer for option to make this silent
-- --       -- luasnip.unlink_current()
-- --       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
-- --     end
-- --   end,
-- -- })
