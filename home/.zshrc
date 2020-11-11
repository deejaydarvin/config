#
# Options
#

fpath=(/usr/local/share/zsh-completions $fpath)

LOAD_MODULES=(
	"setup"
	"autocompletion"
	"history"
    "vim-foreground"
    "vimtricks"
    "zman"
    "autopushd"
    "homeshick"
    "task"
    "fasd"
    "fzf"
    # "pure"
	# "syntax-highlighting"
    # "gpg-agent" not needed with mac os at least.
)

# OS Specific choices...
if [[ `uname` == "Darwin" ]]; then 
    # OPAM configuration
    source /Users/robert/.opam/opam-init/init.zsh
else 
    LOAD_MODULES+=( "notify")
fi

# Run the following command to regenerate
# antibody bundle < ~/.zsh/plugins.txt > ~/.zsh/plugins.sh
source ~/.zsh/plugins.sh

autoload -U promptinit; promptinit
prompt pure

#### Do not change anything after this file

[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

for module in $LOAD_MODULES; do
	source "$HOME/.zsh/functions/"$module
done

# vim:set path=~/.zsh/functions/
