" https://www.reddit.com/r/vim/comments/4jhjhu/weekly_vim_tips_and_tricks_thread_10/d379rly
setlocal formatlistpat=^\\s*[\\[({]\\\?\\([0-9]\\+\\\|[iIvVxXlLcCdDmM]\\+\\\|[a-zA-Z]\\)[\\]:.)}]\\s\\+\\\|^\\s*[-+o*]\\s\\+
setlocal spell
set spelllang=de,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>ui

let g:ale_linters = {'text': 'all'}

call deoplete#custom#buffer_option('auto_complete', v:false)
