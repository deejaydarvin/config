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
)

# OS Specific choices...
if [[ `uname` == "Darwin" ]]; then 
    # OPAM configuration
    source /Users/robert/.opam/opam-init/init.zsh
    eval "$(/opt/homebrew/bin/brew shellenv)"
else 
    LOAD_MODULES+=( "notify")
fi

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "wookayin/fzf-fasd"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose # for more details


#### Do not change anything after this file

[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

for module in $LOAD_MODULES; do
	source "$HOME/.zsh/functions/"$module
done

# vim:set path=~/.zsh/functions/
