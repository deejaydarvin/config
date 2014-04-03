if filereadable("/Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim")
	source /Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim
endif

setlocal tw=70
setlocal iskeyword+=@,:,-

" substitute symbols by UTF-8 chars
set conceallevel=2
" but not subscripts
let g:tex_conceal="admg"
" don't apply special syntaxhighlighting on conceal
hi clear Conceal

let g:tex_comment_nospell= 1

setlocal fo+=nt

setlocal spell spelllang=en
setlocal thesaurus+='~/.vim/thesaurus/mthesaur.txt'

setlocal autowrite
map <buffer> \m :Make<CR> 
map <buffer> \p :make open<CR>
nnoremap <buffer> gB ebyw:split references.bib/"
nnoremap <buffer> gC ebyw:split commands.tex/"

let g:syntastic_quiet_warnings=1

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
else
		" does not work with filenames that contain spaces	
  " exec "setlocal makeprg=rubber\\ -d\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif

