colorscheme murphy
"
"**************************************
"*************** Pathogen Plugin ******
call pathogen#infect()
call pathogen#helptags()

"************************************************************
"********* Standard Stuff ***********************************

set nocompatible

set sw=4 ts=4
" set the syntax highlighting, colors
set background=dark

set scrolloff=2
set wildmode=list:longest
set smartcase

set incsearch

set noerrorbells
set novisualbell
set t_vb=

set wrap
set lbr "line break: don't break middle of a word

set sidescroll=5
set laststatus=1

set keywordprg=":help"

"remember marks
set viminfo='100,f1

"keep vim from screwing up creation dates, labels, etc.
set nowb

"set nobackup    " do not keep a backup file, use versions instead
"set backupcopy "no"

set history=150    " keep 50 lines of command line history
set showcmd    " display incomplete commands
set incsearch    " do incremental searching

set hidden

if &t_Co > 2 || has("gui_running")
" Switch syntax highlighting on, when the terminal has colors
  syntax on
" Also switch on highlighting the last used search pattern.
  set hlsearch
endif
"
"set list

set ruler
"set rulerformat=


" Only do this part when compiled with support for autocommands.
if has("autocmd")
   "built-in vim functions
  augroup vimrcEx
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal g`\"" | endif

  augroup END
endif " has("autocmd")

"*************** VIM LATEX ************
filetype plugin on
filetype indent on

"**************************************
"*************** Tag List plugin ******
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'

set foldlevel=1


"**************************************
"*************** Nerdtree Plugin ******

nnoremap <silent> \n :NERDTreeToggle<CR>

"***************************************
"********** Lusty Jugglyer Plugin ******
"Suppress Warnings on old vim version
let g:LustyJugglerSuppressRubyWarning = 1
