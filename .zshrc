# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="simple"
#ZSH_THEME="theunraveler"

# Example aliases
source ~/.aliases

# alias polyvim='rlwrap poly --use ~/.polyml/vimhol.ml'
# alias holvim='rlwrap ~/src/HOL/bin/hol --use ~/.hol-config.sml'
export RLWRAP_EDITOR="vi +%L"

# vi mode
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
 # much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_TMUX_AUTOSTART=false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux colored-man osx taskwarrior vi-mode svn pass)


source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias vim=~/bin/vim
export EDITOR=vim
export PATH=/Applications/git-annex.app/Contents/MacOS/bundle:/Users/robert/Library/Haskell/bin:/usr/local/share/python:/Users/robert/Documents/computern/android/android\ sdk/android-sdk-macosx/platform-tools:/usr/local/sbin:/usr/local/bin:/Users/robert/bin:$PATH

export MAUDE_LIB=/Users/robert/bin/maudelib

__git_files () { 
	    _wanted files expl 'local files' _files     
	}


#fortune ~/.fortunes
