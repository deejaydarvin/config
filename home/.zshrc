#
# Options
#

LOAD_MODULES=(
	"setup"
	"autocompletion"
	"history"
	"git"
	"syntax-highlighting"
	"notify"
    "vimtricks"
    "vim-foreground"
    "zman"
    "autopushd"
    "homeshick"
    "pass.zsh-completion"
)
LOAD_THEME="gears_plain"

#### Do not change anything after this file

autoload -U colors && colors													# Enable colors in prompt

setopt prompt_subst
setopt extended_glob

[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

function OnLoad()
{
	source "$HOME/.zsh/themes/"$LOAD_THEME".zsh"

	__theme_Init

	for module in $LOAD_MODULES; do
		source "$HOME/.zsh/functions/"$module
	done
}

function chpwd()
{
	__theme_OnPWD
}
function precmd()
{
	__theme_OnCMD
}

OnLoad

unset LOAD_MODULES
unset LOAD_THEME
