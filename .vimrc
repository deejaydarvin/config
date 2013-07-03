"**************************************
"*************** Pathogen Plugin ******
call pathogen#infect()
call pathogen#helptags()
"************************************************************
"********* Standard Stuff ***********************************

set nocompatible

set sw=4 ts=4
" set the syntax highlighting, colors

" colorscheme desert
" colorscheme molokai
" colorscheme ironman
colorscheme jellybeans

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

set colorcolumn=85
" These lines manage my line wrapping settings and also show a colored column at
" 85 characters (so I can see when I write a too-long line of code).

" See :help fo-table and the Vimcasts on soft wrapping and hard wrapping for
" more information.

set backspace=indent,eol,start

nnoremap j gj
nnoremap k gk

set sidescroll=5
set laststatus=1

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
set smartcase

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

set relativenumber
" changes Vim’s line number column to display how far away each line is from the current one, instead of showing the absolute line number.
set undofile
" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. These files contain undo information so you can undo previous actions even after you close and reopen a file.

" Make search more sane
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
" The first two lines fix Vim’s horribly broken default regex “handling” by
" automatically inserting a \v before any string you search for. This turns off
" Vim’s crazy default regex characters and makes searches use normal regexes. I
" already know Perl/Python compatible regex formatting, why would I want to
" learn another scheme?

" ignorecase and smartcase together make Vim deal with case-sensitive search
" intelligently. If you search for an all-lowercase string your search will be
" case-insensitive, but if one or more characters is uppercase the search will
" be case-sensitive. Most of the time this does what you want.

" gdefault applies substitutions globally on lines. For example, instead of
" :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you want
" (when was the last time you wanted to only replace the first occurrence of a
" word on a line?) and if you need the previous behavior you just tack on the g
" again.

" incsearch, showmatch and hlsearch work together to highlight search results
" (as you type). It’s really quite handy, as long as you have the next line as
" well.

" The <leader><space> mapping makes it easy to clear out a search by typing
" ,<space>. This gets rid of the distracting highlighting once I’ve found what
" I’m looking for.

" The last two lines make the tab key match bracket pairs. I use this to move
" around all the time and <tab> is a hell of a lot easier to type than %.

nnoremap <leader>q gqip

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

"*************** STORE SWAP BACK AND UNDO IN BLA DIR ************
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

"*************** VIM LATEX ************
filetype plugin on
filetype indent on

"**************************************
"*************** Tag List plugin ******
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'

set foldlevel=1
autocmd FileType taglist setlocal norelativenumber


"**************************************
"*************** Nerdtree Plugin ******

nnoremap <silent> \n :NERDTreeToggle<CR>
autocmd FileType nerdtree setlocal norelativenumber

"***************************************
"********** Lusty Jugglyer Plugin ******
"Suppress Warnings on old vim version
let g:LustyJugglerSuppressRubyWarning = 1

"***************************************
"********** Ulti Snips ******
let g:UltiSnipsEditSplit = 'horizontal'

"*******************************
"***********Syntastic plugin****
" smaller statusline
" set statusline=%F%m%r%h%w 
" set statusline +=\ %n\ %*            "buffer number
" set statusline +=[%{strlen(&fenc)?&fenc:&enc}]
" set statusline +=%m                "modified flag
" set statusline +=*%=%5l%*
" set statusline +=/%L%*               "total lines

set statusline=%<\ %F%=\ %{&fileformat}\ \|\ %{&fileencoding}\ \|\ %{&filetype}\ \|\ %p%%\ \|\ LN\ %l:%c\ 

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'


" ************************************************************
" ******************Load dictionaries based on filetype*******
au FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))

"**************************************
"*************** Custom Keybindings ***
map <silent> <Leader>b :LustyJuggler<CR>
map <silent> <Leader>e :LustyFilesystemExplorer<CR>
nmap <silent> <Leader>x :bn<CR>
nmap <silent> <Leader>z :bp<CR>
nnoremap <silent> \t :TlistOpen<CR>

" save sessions with .vis extension
map <leader>s :mksession!  session.vis<CR>
nmap <leader>ln :setlocal relativenumber!<CR>
    
" Save when losing focus
au FocusLost * :wa

" automatically source vim sessions so I can open them with the finder
au BufRead *.vis so %

" MAC Magic
"  anything you copy from vim by the usual vim commands (y, d, x, etc.)
"  will be available on your system clipboard and thus pastable.
set clipboard=unnamed
" allows to use the mousewheel for scrolling, at least in iterm2.
set mouse=a

" only show 10 spell suggestions
set spellsuggest=10
