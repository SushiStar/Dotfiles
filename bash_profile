
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
#export PATH=/usr/local/cmake/bin:$PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Library/TeX/texbin"

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g++='g++ --std=c++17'

function cd {
    builtin cd "$@" && ls 
    }

#customize
bind '"\e[B": history-search-forward'
bind '"\e[A": history-search-backward'

# run from waynedu directory
export PS1="\W > "

#export PATH=$PATH:~/.nexustools

##
# Your previous /Users/waynedu/.bash_profile file was backed up as /Users/waynedu/.bash_profile.macports-saved_2018-04-11_at_01:50:05
##

# MacPorts Installer addition on 2018-04-11_at_01:50:05: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.



# Setup julia
alias julia="/Applications/Julia-1.0.app/Contents/Resources/julia/bin/julia"


# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file 
#  instead of overwriting it
shopt -s histappend
# After each command, append to the history file 
#  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/vim


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
