set go-=T
set go-=m
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n" "Mac options here
        " set guifont= Menlo\ For\ Powerline:h11
        set macligatures
        set guifont=Fira\ Code:h12
    else
        if s:uname == "Linux\n"
            set guifont=Terminus\ 10,\ Mensch\ 11,\ Inconsolata\ Medium\ 11,\ DejaVu\ Sans\ Mono\ 10,\ DejaVu\ Sans\ Mono\ 10
        endif
    endif
endif
" set bg=dark
" if &background == "dark"
"     hi normal guibg=black
"     set transp=0
" endif
