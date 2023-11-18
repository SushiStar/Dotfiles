# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh/"
ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="gitster"
ZSH_THEME="chill"
# ZSH_THEME="bullet-train"

export HISTSIZE=10000

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

plugins=(
         zsh-autosuggestions
		 history-substring-search
         )

source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='nvim'

# remove user@hostname
# export DEFAULT_USER=$USER

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey '^ ' autosuggest-accept

# from bash
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/sbin:/usr/sbin"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CXXFLAGS="-I/usr/local/opt/llvm/include/c++/v1"

alias ctags=/usr/local/bin/ctags
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias llt='ls -lt'
alias lc='ls -l | wc -l'
alias grep='grep --color=auto'
alias textedit='open -a TextEdit'
alias gitlog='git log --graph --decorate --oneline'
alias vim='nvim'

function cd {
    builtin cd "$@" && ls
}

function acp() {
  git add -A
  git commit -m "$1"
  git push
}

bindkey '^ ' autosuggest-accept

# for fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
source ~/.fzf.zsh

export DAILY_DIR="$HOME/playground/daily"
