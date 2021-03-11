"**************************************
"*************** Vundle Plugin ******
set nocompatible               " be iMproved
filetype off                   " required!

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" checkout zone

Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' 
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'

" branch viewer addon for fugitive
Plug 'gregsexton/gitv'

Plug 'wellle/targets.vim'

" tried: ale (old), coc (nodejs), vim-lsp, vim-lsc, (incomplete)

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'freitass/todo.txt-vim'

" Mail writing.
Plug 'https://github.com/dbeniamine/vim-mail.git'
Plug 'chrisbra/CheckAttach'

" TeX
" Plug 'lervag/vimtex'
Plug 'ervandew/supertab'
" Plug 'ajh17/VimCompletesMe'
"
" Plug 'rhysd/vim-grammarous'
Plug 'dpelle/vim-LanguageTool'
let g:languagetool_jar='$HOME/bin/LanguageTool-4.7/languagetool-commandline.jar'

" Haskell
" Plug 'eagletmt/ghcmod-vim'
" Plug 'bitc/vim-hdevtools'

" tamarin
" Plug 'rkunnema/editors', { 'branch': 'develop' }
" uses branch checkout out in that dir
Plug '~/src/tamarin-prover/editors' 

"HTML 
Plug 'tpope/vim-ragtag'
Plug 'nelstrom/vim-markdown-folding'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc' " (need to do pip3 install neovim for this to work)
" endif
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Bling Bling
" Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/jellybeans.vim'
Plug 'robertmeta/nofrils'

Plug 'file:///Users/robert/doc/computern/vim-spelllangcheck'

" Coding.
Plug 'ludovicchabant/vim-gutentags'

" latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()
"
"************************************************************
"********* Standard Stuff ***********************************

" colorscheme molokai
" let g:airline_theme='molokai'

colorscheme jellybeans
let g:airline_theme='jellybeans'

" New stuff.... trying it out
set wildmenu
set path+=** " find looks in sub directories

set scrolloff=10
set wildmode=list:longest

" todo: see if this can be removed
set noerrorbells
set novisualbell
set t_vb=

set wrap
set lbr "line break: don't break middle of a word

set formatoptions=croql "standard
set formatoptions+=n "recognize numbered lists
set formatoptions+=1 "don't break a line after a one-letter word
" set formatoptions+=j "joining lines removes comments
" set formatoptions+=a "extra: autowrap

" tab settings:
set shiftwidth=4 " the size of a "tab"?
set expandtab " behavior for <Tab> in insert mode

set colorcolumn=85
" marking after 85 chars to see overly long lines

" See :help fo-table and the Vimcasts on soft wrapping and hard wrapping for
" more information.

nnoremap j gj
nnoremap k gk

set keywordprg=":help" " could be set to man, too

"remember marks
set viminfo='100,f1

"keep vim from screwing up creation dates, labels, etc.
set nowb

"set nobackup    " do not keep a backup file, use versions instead
"set backupcopy "no"

" search stuff
set history=250    " keep 50 lines of command line history
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

set hidden

set switchbuf=useopen,usetab

" set number
" set relativenumber

" Save when losing focus
au FocusLost * silent! wa

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

" only show 10 spell suggestions
set spellsuggest=10

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"***************************************
"********** vimtex plugin ******
let g:tex_flavor = "latex" "default to latex instead of context or plaintex

"***************************************
"********** CtrlP plugin ******
" don't delete cache upon exit
let g:ctrlp_clear_cache_on_exit=0

" speed up by using ag, the silver searcher
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

"***************************************
"********** Ulti Snips ******
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"***************************************
"********** deoplete Snips ******
let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('auto_complete', v:false)
" This is new style
" call deoplete#custom#var('omni', 'input_patterns', {
"           \ 'tex': g:vimtex#re#deoplete
"           \})


" ************************************************************
" ******************Load dictionaries based on filetype*******
au FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set complete+=k

" ********************************************************
" ************ Always jump to last cursor position *******
if has("autocmd")
  augroup vimrcEx
    autocmd!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal g`\"" | endif
  augroup END
endif " has("autocmd")

"****************************************************************
"*************** Store swap back and undo in bla dir ************
let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif
if exists('+undofile')
  set undofile
endif

"**************************************
"*************** Spell choices for mail
let g:spell_choices = "en_us,de,fr"
"*************** keywords for attachments
let g:attach_check_keywords =',anbei,angehangen,attaché,attachée'
"**************************************
"*************** Custom Keybindings ***
nnoremap <leader>q gqip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

map <silent> <Leader>F :CtrlP .<CR>
map <silent> <Leader>f :CtrlP<CR>
map <silent> <Leader>b :CtrlPBuffer<CR>

nmap <silent> <Leader>gs :Gstatus<CR>
nmap <silent> <Leader>ga :Gcommit -a<CR>
nmap <silent> <Leader>gw :Gwrite<CR>

" system copy and pasete
vnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>d "+d
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
" copy whole file (keeping cursor position)
nnoremap <Leader>c :%y+<CR>

" smaller alternative
" nnoremap <leader>b :ls<CR>:b

map <silent> <Leader>t :CtrlPTag<CR>
map <silent> <Leader>T :CtrlPBufTagAll<CR>

map <silent> <Leader>R :CtrlP ~/Documents/research/<CR>

nmap <silent> <Leader>ga :Git commit -a<CR>
nmap <silent> <Leader>gs :Gstatus<CR>
nmap  <Leader>gP :!git push<CR>
nmap  <Leader>gp :!git pull<CR>

"gtfo
nmap <silent> gof :!xdg-open %:h<CR>
nmap <silent> god :!xdg-open . <CR>
" would like to do it for terminal, but don't know how to call iterm2..
" nmap <silent> got :!open %:h<CR>

" switch to alternative buffer using leader twice and delete buffers
nnoremap <leader><leader> <c-^>
" delecte current buffer
nnoremap <leader>d :BD<CR>

" let Y behave like C and D
nnoremap Y y$

" play macro in q .. (normally Q is ex mode)
map Q @q

" nnoremap <silent> \t :TlistOpen<CR>

" save sessions with .vis extension
map <leader>s :mksession!  session.vis<CR>
    
"**************************************
"*************** Mac specific ***
" allows to use the mousewheel for scrolling, at least in iterm2.
set mouse=a

let g:LanguageClient_serverCommands = {
   \ 'haskell': ['hie-wrapper'],
   \ 'tex': ['texlab'],
   \ }

" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>lc :call LanguageClient_contextMenu()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

" Antidote
function CallAntidote10()
  :w
  echom system("open -a /Applications/Antidote/Antidote\\ 10.app \"". bufname("%")."\"")
  let choice=confirm ("Done saving?","&Yes",1)
  echo "Reloaded"
  :e
endfunction
 
nmap <Leader>a :call CallAntidote10()<CR>
