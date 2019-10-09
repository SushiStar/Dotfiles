# The original version is saved in .bash_profile.pysave
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#export PATH="/usr/local/bin"
#export PATH="$PATH:/Library/TeX/texbin"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias llt='ls -lt'
alias g++='g++ --std=c++11'

function cd {
    builtin cd "$@" && ls 
    }

#customize
bind '"\e[B": history-search-forward'
bind '"\e[A": history-search-backward'


#export TERM=xterm-color
export PS1="\[\033[0;94m\]\W > \[\033[0;97m\]"
export CLICOLOR=1
export LSCOLORS=CxFxCxDxBxegedabagaced

# Setup julia
alias julia="/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia"

# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=1000000
export HISTSIZE=1000000
# When the shell exits, append to the history file 
#  instead of overwriting it
shopt -s histappend
# After each command, append to the history file 
#  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/nvim


# to fix update_terminal_cwd 
update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
