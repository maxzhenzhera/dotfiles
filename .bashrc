#################################################
# Max Zhenzhera
# https://github.com/maxzhenzhera/dotfiles
#################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


### SHOPT ###
shopt -s histappend  # default
shopt -s checkwinsize  # default
### SHOPT ###

stty -ixon  # enable Ctrl+S in reverse-search

### EXPORT ###
export EDITOR="nvim"
export MANPAGER='nvim +Man!'

export XDG_RUNTIME_DIR=/run/user/`id -u`  # user systemd

export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTFILESIZE=100000
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
### EXPORT ###


### PATH ###
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.wine/bin" ]; then
    export WINEPATH="$HOME/.wine/bin"
fi

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
### PATH ###


### PS1 ###
_BLACK=$(tput setaf 0)
_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_YELLOW=$(tput setaf 3)
_BLUE=$(tput setaf 4)
_MAGENTA=$(tput setaf 5)
_CYAN=$(tput setaf 6)
_WHITE=$(tput setaf 7)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)

PS1='\[${_GREEN}\]\u@\h\[${_RESET}\]:\[${_BLUE}\]\w\[${_BOLD}\]\[${_YELLOW}\]$(__git_ps1)\[${_RESET}\]$ ' 
### PS1 ###


### ALIASES ###
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias exit-code='echo $?'
alias tm='tmux new -s local'
alias tb="nc termbin.com 9999"
### ALIASES ###


### Not public / local bashrc ###
if [ -f "$HOME/.bashrc.local" ]; then
    . "$HOME/.bashrc.local"
fi
### Not public / local bashrc ###
