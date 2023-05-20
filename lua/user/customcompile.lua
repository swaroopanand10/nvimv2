-- BELOW COMMANDS ARE FOR COMPILING AND RUNNING
-- vim.cmd [[autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>]]
-- vim.cmd [[autocmd filetype cpp nnoremap <F5> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out <CR>]]
-- vim.cmd [[autocmd vimEnter *.cpp map <F9> :w <CR> :!clear ; g++ --std=c++11 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>]]
-- vim.cmd [[autocmd filetype cpp nnoremap <C-c> :w <bar> !clear && g++ -std=gnu++14 -O2 % -o %:p:h/%:t:r.exe && ./%:r.exe<CR>]]
-- vim.cmd [[autocmd filetype cpp nnoremap <F9> :!g++ -o %:p:h/a.out % -std=c++17 && !%:p:h/a.out<Enter>]]

-- For cpp ...
-- vim.cmd [[autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -O2 % -o %:p:h/a.out && %:p:h/a.out<Enter><CR>]]
vim.cmd [[autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -O2 % &>%:p:h/out.txt -o %:p:h/a.out && %:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]
vim.cmd [[autocmd filetype c nnoremap <F9> :w <bar> !gcc -O2 % &>%:p:h/out.txt -o %:p:h/a.out && %:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]

-- vim.cmd [[nnoremap <C-c> :!g++ -o %:p:h/a.out % -std=c++17<Enter><CR>]]
-- vim.cmd [[nnoremap <C-x> :!%:p:h/a.out<Enter><CR>]]

-- vim.cmd [[nnoremap <C-c> :w <bar> :!g++ -o %:p:h/a.out % &>%:p:h/out.txt -std=c++17<Enter><CR>]]
-- vim.cmd [[nnoremap <C-x> :!%:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]
vim.cmd [[autocmd filetype cpp nnoremap <C-x> :!%:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]

-- For python...
-- vim.cmd [[ autocmd filetype python nnoremap <C-c> :w <bar> !python % <Enter><CR> ]]
vim.cmd [[ autocmd filetype python nnoremap <C-x> :w <bar> !python % < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR> ]] -- had to change the shortcut form C-c to C-x so that i can cancel the buggy code at any time

-- for javascript
vim.cmd [[ autocmd filetype javascript nnoremap <C-x> :w <bar> !node % &> %:p:h/out.txt <Enter><CR> ]] -- had to change the shortcut form C-c to C-x so that i can cancel the buggy code at any time

-- for rust 
vim.cmd [[autocmd filetype rust nnoremap <F9> :w <bar> !rustc % &> %:p:h/extra/out.txt -o %:p:h/extra/a.out && %:p:h/extra/a.out < %:p:h/extra/in.txt &> %:p:h/extra/out.txt <Enter><CR>]]
-- vim.cmd [[nnoremap <C-x> :!%:p:h/extra/a.out < %:p:h/extra/in.txt &> %:p:h/extra/out.txt <Enter><CR>]]
vim.cmd [[autocmd filetype rust nnoremap <C-x> :!%:p:h/extra/a.out < %:p:h/extra/in.txt &> %:p:h/extra/out.txt <Enter><CR>]]
