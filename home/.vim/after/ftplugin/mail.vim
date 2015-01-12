set spell
let g:spelllangcheck_list = [ 'de', 'fr', 'en' ]
autocmd! InsertLeave <Buffer> :SetSpelllang
