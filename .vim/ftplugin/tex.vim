set tw=75

set spell spelllang=en
set autowrite
map <buffer> \m :!make &
map <buffer> \p :!open %:r.pdf
nnoremap <silent> \t :TlistOpen<CR>
"imap <buffer> __ _{}<Left>

"If you want to try..
"iab <buffer> __ _{}<Left>

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
else
  exec "setlocal makeprg=make\\ -f\\ ~/src/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif

