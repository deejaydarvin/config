"**************************************
"*************** Vundle Plugin ******
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Bundle 'gmarik/vundle'

" checkout zone


" Bundle 'sjbach/lusty'
Bundle 'ctrlp.vim'
" Bundle 'scrooloose/nerdtree.git'
Bundle 'godlygeek/tabular.git'
" Bundle 'vim-scripts/taglist.vim.git'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch.git'
Bundle 'tpope/vim-unimpaired'
Bundle 'edsono/vim-matchit.git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'szw/vim-tags.git'
Bundle 'christoomey/vim-tmux-navigator.git'
" Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'

" Bling Bling
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tomasr/molokai'
Bundle 'jellybeans.vim'


" helpful when coding, but I am not coding atm
" Bundle 'tpope/vim-fugitive' "supposed to be super good with git
" this one too: 
" airblade/vim-gitgutter
" Bundle 'majutsushi/tagbar.git'
" Bundle 'mhinz/vim-signify.git'
"
" Maybe good for coding, not good for writing tex.
" don't forget to run install script for this one.
" Bundle 'Valloric/YouCompleteMe'

Bundle 'bufkill.vim'
Bundle 'vcscommand.vim'


"Stuff that's lying around
Bundle 'file://~/.vim/bundle/vimpoly'
" Bundle 'file://~/.vim/bundle/latex-parformat'

"************************************************************
"********* Standard Stuff ***********************************

filetype plugin on
filetype indent on

set nocompatible

set sw=4 ts=4
" set the syntax highlighting, colors

" colorscheme desert
" colorscheme ironman

colorscheme molokai
let g:airline_theme='molokai'

" colorscheme jellybeans
" let g:airline_theme='jellybeans'

set scrolloff=10
set wildmode=list:longest

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
set autoindent " strictly necessary but good default for plain text.
set shiftwidth=4 " the size of a "tab"?
set shiftround " behavior for <> and related commands
set expandtab " behavior for <Tab> in insert mode
set smarttab  " use spaces instead of tabs 

set colorcolumn=85
" These lines manage my line wrapping settings and also show a colored column at
" 85 characters (so I can see when I write a too-long line of code).

" See :help fo-table and the Vimcasts on soft wrapping and hard wrapping for
" more information.

set backspace=indent,eol,start

nnoremap j gj
nnoremap k gk

set sidescroll=5
set laststatus=2

set keywordprg=":help"

"remember marks
set viminfo='100,f1

"keep vim from screwing up creation dates, labels, etc.
set nowb

"set nobackup    " do not keep a backup file, use versions instead
"set backupcopy "no"

" search stuff
set history=250    " keep 50 lines of command line history
set showcmd    " display incomplete commands
set incsearch    " do incremental searching
set ignorecase
set smartcase
nnoremap / /\v
vnoremap / /\v
set gdefault
set showmatch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set hidden

set switchbuf=useopen,usetab

if &t_Co > 2 || has("gui_running")
" Switch syntax highlighting on, when the terminal has colors
  syntax on
" Also switch on highlighting the last used search pattern.
  set hlsearch
endif
"
set ruler

set relativenumber
set number
set undofile

" Save when losing focus
au FocusLost * silent! wa

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

" only show 10 spell suggestions
set spellsuggest=10

" use comma as <Leader> key instead of backslash
" let mapleader=","

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>




"**************************************
"*************** Tag List plugin ******
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'

set foldlevel=1
autocmd FileType taglist setlocal norelativenumber


"**************************************
"*************** Nerdtree Plugin ******

" nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" autocmd FileType nerdtree setlocal norelativenumber

" alternative to nerdtree: netrw in tree style
nnoremap <silent> <leader>n :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

"***************************************
"********** CtrlP plugin ******
" don't delete cache upon exit
let g:ctrlp_clear_cache_on_exit=0

"***************************************
"********** Ulti Snips ******
let g:UltiSnipsEditSplit = 'horizontal'
"
"***************************************
"********** Airline  ******
let g:UltiSnipsEditSplit = 'horizontal'
let g:airline_powerline_fonts = 1

"*******************************
"***********Syntastic plugin****
" smaller statusline
" set statusline=%F%m%r%h%w 
" set statusline +=\ %n\ %*            "buffer number
" set statusline +=[%{strlen(&fenc)?&fenc:&enc}]
" set statusline +=%m                "modified flag
" set statusline +=*%=%5l%*
" set statusline +=/%L%*               "total lines

" set statusline=%<\ %F%=\ %{&fileformat}\ \|\ %{&fileencoding}\ \|\ %{&filetype}\ \|\ %p%%\ \|\ LN\ %l:%c\ 

set statusline=%<\ %n:%t\ %m%r%y%w%=\%l\/\%L\ %p%%\ :\ \%c

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
"
" set fillchars=stl:―,stlnc:—,vert:│,fold:۰,diff:·



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
"*************** Custom Keybindings ***
nnoremap <leader>q gqip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" map <silent> <Leader>b :LustyJuggler<CR>
" map <silent> <Leader>e :LustyFilesystemExplorer<CR>
map <silent> <Leader>f :CtrlP .<CR>
map <silent> <Leader>F :CtrlP<CR>
map <silent> <Leader>B :CtrlPBuffer<CR>
nnoremap <leader>b :ls<CR>:b

map <silent> TT :CtrlPTag<CR>
map <silent> Tb :CtrlPBufTag<CR>
map <silent> TB :CtrlPBufTagAll<CR>

map <silent> <Leader>H :CtrlP ~/Documents/research/secure_apis/<CR>
map <silent> <Leader>T :CtrlP ~/Documents/research/secure_apis/thesis/<CR>

"gtfo
nmap <silent> gof :!open %:h<CR>
nmap <silent> goF :!open . <CR>
" would like to do it for terminal, but don't know how to call iterm2..
" nmap <silent> got :!open %:h<CR>

" unimpaired plugin offers bindings, too
" nmap <silent> <Leader>x :bn<CR>
" nmap <silent> <Leader>z :bp<CR>

" switch to alternative buffer using leader twice
nnoremap <leader><leader> <c-^>

" switch to alternative buffer using leader twice
nnoremap <leader>d :BD<CR>

" nnoremap <silent> \t :TlistOpen<CR>

" save sessions with .vis extension
map <leader>s :mksession!  session.vis<CR>
nmap <leader>ln :setlocal relativenumber!<CR>
    
"**************************************
"*************** Mac specific ***
"  anything you copy from vim by the usual vim commands (y, d, x, etc.)
"  will be available on your system clipboard and thus pastable.
set clipboard=unnamed
" allows to use the mousewheel for scrolling, at least in iterm2.
set mouse=a
