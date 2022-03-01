if filereadable("/Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim")
	source /Users/robert/.vim/bundle/latex-parformat/ftplugin/tex.vim
endif

setlocal tw=70
" let g:tex_isk = '48-57,a-z,A-Z,192-255,:,-,@'
setlocal iskeyword=48-57,a-z,A-Z,192-255,:,-,@,\
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

let g:tex_flavor='latex'

setlocal wildignore=*.aux,*.log,*.pdf

let g:tex_comment_nospell= 1

setlocal fo+=nt

setlocal spell
" autocmd! InsertLeave % :SetSpelllang
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>ui 
"jumps to the pre­vi­ous spelling mis­take [s, then picks the first
"sug­ges­tion 1z=, and then jumps back `]a. The <c-g>u in the mid­dle make it
"pos­si­ble to undo the spelling cor­rec­tion quick­ly.

setlocal thesaurus+='~/.vim/thesaurus/mthesaur.txt'

setlocal autowrite
map <buffer> \m :Make<CR> 
" map <buffer> \p :make open<CR> " clashes with shortcut for paste
nnoremap <buffer> gB ebyw:split references.bib/"
nnoremap <buffer> gC ebyw:split commands.tex/"

" let b:syntastic_mode = 'passive'
" let g:syntastic_tex_checkers = ["lacheck", "chktex", "proselint"]
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_quiet_warnings=1
" map <buffer> \S :SyntasticCheck\|SyntasticSetLoclist

map <buffer> \L :LanguageToolCheck

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
else
		" does not work with filenames that contain spaces	
  " exec "setlocal makeprg=rubber\\ -d\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif

let g:vimtex_view_general_viewer
            \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out])
    else
        call system(join(l:cmd + [line('.'), shellescape(l:out)], ' '))
    endif
endfunction

" https://www.reddit.com/r/vim/comments/4mobsr/weekly_vim_tips_and_tricks_thread_13/d3x5ch8
set suffixes+=*.sty,*.bst,*.cls

" folding by \iffullversion etc.
set fdm=manual
" set fdm=expr
" set foldexpr=getline(v:lnum-1)=~'\\\\if\\\|\\\\else'?'>1':(getline(v:lnum+1)=~'\\\\fi\\\|\\\\else'?'<1':-1)

syn match texStatement /\\index{[^}]*}\+/ conceal cchar=⚓
syn match texStatement /\\ref/ nextgroup=texCite conceal cchar=☸ " ☸ WHEEL OF DHARMA Unicode: U+2638, UTF-8: E2 98 B8
syn match texStatement /\\item/ conceal cchar=–
syn match texStatement /\\marginnote{[^}]*}\+/ conceal cchar=ⁿ

" " this tries omnifunc first if defined and then the default
" au FileType *
"             \ if &omnifunc != '' |
"             \   call SuperTabChain(&omnifunc, "<c-p>") |
"             \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"             \ endif

" let b:vcm_omni_pattern = 
"     \ '\v\\%('
"     \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"     \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
"     \ . '|hyperref\s*\[[^]]*'
"     \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"     \ . '|%(include%(only)?|input)\s*\{[^}]*'
"     \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"     \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
"     \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
"     \ . ')'
