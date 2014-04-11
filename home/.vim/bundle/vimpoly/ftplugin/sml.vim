" if exists("b:did_hol")
"   finish
" endif

let maplocalleader = "\\"

let s:holpipe = "/Users/robert/.polyml/vim_fifo"
let s:tmpprefix = "/tmp/vimhol"

new
set buftype=nofile
set bufhidden=hide
set noswapfile
let s:holnr = bufnr("")
hide

fu! TempName()
  let l:n = 0
  while glob(s:tmpprefix.l:n) != ""
    let l:n = l:n + 1
  endwhile
  return s:tmpprefix.l:n
endf

fu! HOLCStart()
  let s:prev = bufnr("")
  let s:wins = winsaveview()
  silent exe "keepjumps hide bu" s:holnr
  setlocal foldmethod=manual
  keepjumps %d_
endf

fu! HOLCRestore()
  silent exe "w>>" . s:holpipe
  silent exe "keepjumps bu" s:prev
  call winrestview(s:wins)
endf

fu! HOLCEnd()
  let s:temp = TempName()
  silent exe "w" . s:temp
  keepjumps %d_
  silent exe "normal iReadFile " . s:temp
  call HOLCRestore()
endf

fu! HOLLoadSetup()
  keepjumps silent normal P
  keepjumps silent %s/\s/\r/ge
  keepjumps silent %s/\<local\>\|\<open\>\|\<in\>\|\<end\>\|;//ge
  keepjumps silent g/^\s*$/d_
  keepjumps silent g/./normal ival _ = load"
  keepjumps silent g/./normal $a";
endf

fu! HOLLoad()
  call HOLLoadSetup()
  call HOLLoadMessage("HOLLoad",line("$"))
endf

fu! HOLLoadSendQuiet()
  call HOLLoadSetup()
  exe "keepjumps normal Go" . s:holtogglequiet
  let l:l = line(".")-1
  silent normal op
  exe "keepjumps normal Go" . s:holtogglequiet
  call HOLLoadMessage("HOLLoadSendQuiet",l:l)
endf

fu! HOLLoadMessage(s,l)
  keepjumps normal Goval _ = print "
  execute "normal a" . a:s
  execute "keepjumps silent 1," . a:l . "g/./normal f\"yi\"G$a p"
  keepjumps normal G$a completed\n";
endf

fu! HOLSend()
  silent normal P
  call HOLEnsureEnd()
endf

fu! HOLEnsureEnd()
  keepjumps normal G$a;
endf

fu! HOLSendQuiet()
  call HOLSend()
  exe "keepjumps normal ggO" . s:holtogglequiet
  exe "keepjumps normal Go" . s:holtogglequiet
endf

fu! HOLGoal()
  silent keepjumps normal pG$
  keepjumps normal G$a)
  while search(',\_s*)\%$','bW')
    silent keepjumps normal vG$"_dG$a)
  endw
  keepjumps normal gg0iproofManagerLib.g(
endf

let s:stripStart     = ')\|\]\|\['
let s:stripEnd       = '(\|\['
let s:stripBothWords = 'THEN[1L]\?\|by'
let s:stripBoth      = ',\|<<\|>>\|++\|\\\\\|>-\|>|'
let s:delim          = '\_[[:space:]()]'

fu! HOLExpand()
  silent keepjumps normal pgg0
  while search('\%^\_s*\%(\%('.s:stripBoth.'\|'.s:stripStart.'\)\|\%('.s:stripBothWords.'\)\ze'.s:delim.'\)','cWe')
    silent keepjumps normal vgg0"_d
  endw
  while search('\%(\%('.s:stripBoth.'\|'.s:stripEnd.'\)\|'.s:delim.'\zs\%('.s:stripBothWords.'\)\)\_s*\%$','cW')
    silent keepjumps normal vG$"_dgg0
  endw
  keepjumps normal iproofManagerLib.expand(
  keepjumps normal G$a)
endf

fu! HOLSubgoal()
  keepjumps normal iproofManagerLib.expand(
  silent normal p
  if search(s:delim.'by'.s:delim.'\_.*','cW')
    silent keepjumps normal vG$"_d
  en
  silent keepjumps normal G$a by ALL_TAC)
endf

fu! HOLF(f)
  exe "normal i" . a:f
endf

fu! YankThenHOLCall(f,a) range
  silent normal gvy
  call HOLCall(a:f,a:a)
  exe "normal gv\<Esc>"
endf

fu! HOLCall(f,a)
  call HOLCStart()
  call call(a:f,a:a)
  call HOLCEnd()
endf

fu! HOLRepeat(s)
  call HOLCStart()
  exe "normal" v:count1 . "i" . a:s
  call HOLCEnd()
endf

fu! HOLRotate()
  call HOLCStart()
  exe "normal iproofManagerLib.rotate(" . v:count1 .")"
  call HOLCEnd()
endf

fu! HOLINT()
  call HOLCStart()
  normal iInterrupt
  call HOLCRestore()
endf

fu! HOLSelect(l,r)
  let l:cursor = getpos(".")
  if search(a:l,"Wbc") == 0
    return
  endif
  normal v
  if search(a:r,"W") == 0
    normal <ESC>
    call setpos('.', l:cursor)
    return
  endif
  call search(a:r,"ce")
endf

vn <silent> <LocalLeader>s :call YankThenHOLCall(function("HOLSend"),[])<CR>
nm <expr> <silent> <LocalLeader>s "V".maplocalleader."s"
nn <silent> <LocalLeader>c :call HOLINT()<CR>

let b:did_hol = 1

" vim: ft=vim
