setlocal tw=75
setlocal iskeyword=@,48-57,_,192-255,:


setlocal spell spelllang=en
setlocal autowrite
map <buffer> \m :make<CR> 
map <buffer> \p :make open<CR>

let g:syntastic_quiet_warnings=1

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
else
		" does not work with filenames that contain spaces	
  " exec "setlocal makeprg=make\\ -f\\ ~/src/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif

