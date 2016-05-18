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

Plug 'ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' 
Plug 'edsono/vim-matchit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
" Plug 'szw/vim-tags'
 Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'

Plug 'wellle/targets.vim'

Plug 'scrooloose/syntastic' " Syntax check on LaTeX and more

Plug 'oplatek/Conque-Shell'
Plug 'tarruda/vim-conque-repl' "read-eval-print loops

" Mail writing.
Plug 'dbeniamine/vim-mail'
Plug 'chrisbra/CheckAttach'

" TeX
Plug 'lervag/vimtex'

" Bling Bling
" Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'jellybeans.vim'

Plug 'file:///Users/robert/doc/computern/vim-spelllangcheck'

" Coding.
" Plug 'majutsushi/tagbar.git'
" Plug 'mhinz/vim-signify.git'
" Plug 'scrooloose/nerdtree.git'
" Plug 'vim-scripts/taglist.vim'
"

" Other
" Plug 'christoomey/vim-tmux-navigator.git'
" tmux navigator uses C-L keybinding, which we want for nohl.
" also requires tmux >v1.8
" Plug 'bling/vim-airline'

"Stuff that's lying around
" Plug 'file://~/.vim/bundle/latex-parformat'
" Plug 'unblevable/quick-scope'

call plug#end()
"
"************************************************************
"********* Standard Stuff ***********************************

" colorscheme desert
" colorscheme ironman

" colorscheme molokai
" let g:airline_theme='molokai'

colorscheme jellybeans
let g:airline_theme='jellybeans'

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


"**************************************
"*************** Tag List plugin ******
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n" "Mac options here
        let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
    else
        if s:uname == "Linux\n"
        let Tlist_Ctags_Cmd="ctags"
        endif
    endif
endif
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
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1

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
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

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
"*************** Spell choices for mail
let g:spell_choices = "en,de,fr"
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

" smaller alternative
" nnoremap <leader>b :ls<CR>:b

map <silent> TT :CtrlPTag<CR>
map <silent> Tb :CtrlPBufTag<CR>
map <silent> TB :CtrlPBufTagAll<CR>

map <silent> <Leader>R :CtrlP ~/Documents/research/<CR>

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
