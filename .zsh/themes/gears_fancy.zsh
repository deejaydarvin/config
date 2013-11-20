THEME_COLOR[1]="%{$bg[blue]%}%{$fg[white]%}"
THEME_COLOR[2]="%{$bg[white]%}%{$fg[green]%}"
THEME_COLOR[3]="%{$bg[green]%}%{$fg[red]%}"
THEME_SEPCOLOR1=("%{$fg[blue]%}" "%{$bg[white]%}")
THEME_SEPCOLOR2=("%{$fg[white]%}" "%{$bg[green]%}")
THEME_SEPCOLOR3=("%{$reset_color%}" "%{$fg[green]%}")

THEME_ICON_SEPARATOR="⮀"
THEME_ICON_BRANCH="⭠"
THEME_ICON_ADDED="+"
THEME_ICON_REMOVED="-"
THEME_ICON_CHANGED="•"
THEME_ICON_MOVED="►"
THEME_ICON_OK="√"
THEME_ICON_AHEAD="▲"
THEME_ICON_BEHIND="▼"

#   

THEME_PROMPTSOURCE_LEFT[1]=""
THEME_PROMPTSOURCE_LEFT[2]=""
THEME_PROMPTSOURCE_LEFT[3]=""

THEME_HOOKS1=()
THEME_HOOKS2=()

function __theme_Directory()
{
	local output
	local __prompt_dir

	output=""

	if [[ "$PWD" != "/" ]]; then
		__prompt_dir=$(dirname $PWD)

		for segment in $(echo $__prompt_dir | sed -e 's/\// /g'); do
			output+="/"${segment[1]}
		done

		output+="/"$(basename $PWD)
	else
		output="/"
	fi

	echo $output
}

function __theme_Draw()
{
	PROMPT=$THEME_COLOR[1]$THEME_PROMPTSOURCE_LEFT[1]
	PROMPT+=$THEME_SEPCOLOR1[1]$THEME_SEPCOLOR1[2]$THEME_ICON_SEPARATOR

	if [[ ${#THEME_PROMPTSOURCE_LEFT[3]} -eq 0 ]]; then
		PROMPT+=$THEME_COLOR[2]$THEME_PROMPTSOURCE_LEFT[2]
		PROMPT+=$THEME_SEPCOLOR3[1]$THEME_SEPCOLOR2[1]$THEME_ICON_SEPARATOR
	else
		PROMPT+=$THEME_COLOR[2]$THEME_PROMPTSOURCE_LEFT[2]
		PROMPT+=$THEME_SEPCOLOR2[1]$THEME_SEPCOLOR2[2]$THEME_ICON_SEPARATOR

		PROMPT+=$THEME_COLOR[3]$THEME_PROMPTSOURCE_LEFT[3]
		PROMPT+=$THEME_SEPCOLOR3[1]$THEME_SEPCOLOR3[2]$THEME_ICON_SEPARATOR
	fi

	PROMPT+="%{$reset_color%} "
}

function __theme_Hook()
{
	case "$1" in
		"OnPWD")
			THEME_HOOKS1+=$2
		;;
		"OnCMD")
			THEME_HOOKS2+=$2
		;;
	esac
}

function __theme_AddLeft()
{
	case "$1" in
		"hostinfo")
			THEME_PROMPTSOURCE_LEFT[1]+=$2
		;;
		"directory")
			THEME_PROMPTSOURCE_LEFT[2]+=$2
		;;
		"extras")
			THEME_PROMPTSOURCE_LEFT[3]+=$2
		;;
	esac
}

function __theme_Init()
{
	THEME_PROMPTSOURCE_LEFT[1]=""
	THEME_PROMPTSOURCE_LEFT[2]=""
	THEME_PROMPTSOURCE_LEFT[3]=""

	__theme_AddLeft "hostinfo" "%n@%m"
	__theme_AddLeft "directory" "\$(__theme_Directory)"
}

function __theme_OnPWD()
{
	__theme_Init

	for hook in $THEME_HOOKS1; do
		eval "${hook}"
	done

	__theme_Draw
}

function __theme_OnCMD()
{
	__theme_Init

	for hook in $THEME_HOOKS2; do
		eval "${hook}"
	done

	__theme_Draw
}
