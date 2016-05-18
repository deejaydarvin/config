if filereadable("/Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim")
	source /Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim
endif

setlocal tw=70
let g:tex_isk = '48-57,a-z,A-Z,192-255,:,-,@,\'
" setlocal iskeyword+=@:-
" Wasn't too helpful.
" http://www.reddit.com/r/vim/comments/22431a/i_ctrln_the_motion_w_and_iskeyword/
" autocmd InsertLeave <buffer> :set iskeyword-=/:@-
" autocmd InsertEnter <buffer> :set iskeyword+=/:@-


" substitute symbols by UTF-8 chars
set conceallevel=2
" but not subscripts
let g:tex_conceal="admg"
" don't apply special syntaxhighlighting on conceal
hi clear Conceal

let g:tex_comment_nospell= 1

setlocal fo+=nt

setlocal spell
autocmd! InsertLeave % :SetSpelllang

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

"new: latexbox plugin
let g:LatexBox_Folding=1
