if filereadable("/Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim")
	source /Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim
endif

setlocal tw=70
" let g:tex_isk = '48-57,a-z,A-Z,192-255,:,-,@,\'
setlocal iskeyword=48-57,a-z,A-Z,192-255,:,-,@,\
" setlocal iskeyword+=@:-
" Wasn't too helpful.
" http://www.reddit.com/r/vim/comments/22431a/i_ctrln_the_motion_w_and_iskeyword/
" autocmd InsertEnter <buffer> :set iskeyword+="\\"
" autocmd InsertLeave <buffer> :set iskeyword-="\\"


" substitute symbols by UTF-8 chars
set conceallevel=2
" but not subscripts
let g:tex_conceal="admg"
" don't apply special syntaxhighlighting on conceal
hi clear Conceal

setlocal wildignore=*.aux,*.log,*.pdf

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

" https://www.reddit.com/r/vim/comments/4mobsr/weekly_vim_tips_and_tricks_thread_13/d3x5ch8
set suffixes+=*.sty,*.bst,*.cls

" folding by \iffullversion etc.
set fdm=expr
set foldexpr=getline(v:lnum-1)=~'\\\\if\\\|\\\\else'?'>1':(getline(v:lnum+1)=~'\\\\fi\\\|\\\\else'?'<1':-1)

syn match texStatement /\\index{[^}]*}\+/ conceal cchar=⚓
syn match texStatement /\\ref/ nextgroup=texCite conceal cchar=☸ " ☸ WHEEL OF DHARMA Unicode: U+2638, UTF-8: E2 98 B8
syn match texStatement /\\item/ conceal cchar=–
syn match texStatement /\\marginnote{[^}]*}\+/ conceal cchar=ⁿ

