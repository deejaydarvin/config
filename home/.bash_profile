set -o vi #vim input mode

alias t='task rc:/Users/robert/Documents/research/secure_apis/thesis/.taskrc'

############################################################
########## TAB COMPLETITION           ######################
############################################################

#tab completition for taks warrior
source /usr/local/share/doc/task/scripts/bash/task.sh

#tab completition for brew
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

#tab completition for pass
source /usr/local/Cellar/pass/1.4.2/etc/bash_completion.d/password-store

#tab completition for my pw manager pw.pl (Obsolete, I am using pass now)
_pwpl()
{
	local cur prev opts base
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	opts="new cat ls edit pw"

	case "${prev}" in
		cat|edit)
			local files=$(pw.pl ls)
			COMPREPLY=( $(compgen -W "${files}" -- ${cur}) )
			return 0
			;;
		*)
			;;
	esac

	COMPREPLY=($(compgen -W "${opts}" -- ${cur})) 
	return 0
}
complete -F _pwpl -o dirnames pw.pl

#git vimdiff
function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

#colourful git stuff...
ps_scm_f() {
    local color="\[\033[01;31m\]"
    local s=
	if [ "$PWD" == "$HOME" ]; then
		s=home
    elif [[ -d ".svn" ]] ; then
        local r=$(svnversion)
        local status=$(svn status | grep -q -v '^?' && echo -n "*" )
        s="r$r$status"
        if [ -z "$status" ] ; then
            color="\[\033[01;32m\]" #string is null -> green
        fi
    else
        local d=$(git rev-parse --git-dir 2>/dev/null ) b= r= a=
        if [[ -n "${d}" ]] ; then
            if [[ -d "${d}/../.dotest" ]] ; then
                if [[ -f "${d}/../.dotest/rebase" ]] ; then
                    r="rebase"
                elif [[ -f "${d}/../.dotest/applying" ]] ; then
                    r="am"
                else
                    r="???"
                fi
                b=$(git symbolic-ref HEAD 2>/dev/null )
            elif [[ -f "${d}/.dotest-merge/interactive" ]] ; then
                r="rebase-i"
                b=$(<${d}/.dotest-merge/head-name)
            elif [[ -d "${d}/../.dotest-merge" ]] ; then
                r="rebase-m"
                b=$(<${d}/.dotest-merge/head-name)
            elif [[ -f "${d}/MERGE_HEAD" ]] ; then
                r="merge"
                b=$(git symbolic-ref HEAD 2>/dev/null )
            elif [[ -f "${d}/BISECT_LOG" ]] ; then
                r="bisect"
                b=$(git symbolic-ref HEAD 2>/dev/null )"???"
            else
                r=""
                b=$(git symbolic-ref HEAD 2>/dev/null )
            fi

            if ! git update-index --ignore-submodules --refresh > /dev/null; then
                a="${a}✗"
            fi

            diff=$(git diff-index --cached --name-status -r --ignore-submodules HEAD --)
            case "$diff" in
                ?*) a="${a}±" ;;
            esac

            if [[ -n "$(git ls-files --exclude-standard --others 2> /dev/null)" ]] ; then
                a="${a}?"
            fi

            b=${b#refs/heads/}
            b=${b// }

            [[ -n "${r}${b}${a}" ]] && s="${r:+${r}:}${b}${a:+ ${a}}"


            if test -z "$(git diff-index --name-only HEAD --)"; then
                color="\[\033[01;32m\]" 
                s="${s:+${s}✔}"
            fi
        fi
    fi
    s="${s}${ACTIVE_COMPILER}"
    s="${s:+${s}}"
    printf "$color"
    echo -n "$s"
}

__git_prompt_command() {
    ret=$?
    PS1="\n\[\e[37;1m\]┌─(\[\e[34;1m\]\u@\h\[\e[37;1m\])-(\[\[\e[34;1m\]\w\[\e[37;1m\])-($(ps_scm_f)\[\e[37;1m\])\n\[\e[37;1m\]└─╼ \[\e[0m\]"
}
PS1="\w\$"
PROMPT_COMMAND=__git_prompt_command



