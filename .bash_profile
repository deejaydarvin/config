export PATH=~/bin:$PATH:/usr/local/git/bin/:$HOME/Library/Haskell/bin

test -r /sw/bin/init.sh && . /sw/bin/init.sh

alias secsi_edit="ssh -t datte.lsv vim public_html/gdt-secsi/programme.php"
alias secsi_mail="ssh lsv \"cat public_html/gdt-secsi/programme.php\" | write_mail.pl > ~/Desktop/gdt-secsi.eml"
