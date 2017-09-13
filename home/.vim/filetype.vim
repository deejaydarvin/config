" autocommand to detect .spthy files
augroup filetypedetect
au BufNewFile,BufRead *.spthy	setf spthy
augroup END

"autodetecl files for HOL-4
augroup filetypedetect
  au BufRead,BufNewFile *?Script.sml let maplocalleader = "h" | source $HOME/src/HOL/tools/vim/hol.vim
  "Uncomment the line below to automatically load Unicode
  au BufRead,BufNewFile *?Script.sml source $HOME/src/HOL/tools/vim/holabs.vim
augroup END

