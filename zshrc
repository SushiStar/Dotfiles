# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
# Append a command directly
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -v
export KEYTIMEOUT=1

export ZSH="/Users/$(whoami)/.zsh"
source "/Users/$(whoami)/.zsh/zshrc"

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

# plugins=(
         # zsh-autosuggestions
		 # history-substring-search
         # zsh-vi-mode
         # )
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# source ~/.oh-my-zsh/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='nvim'

# remove user@hostname
# export DEFAULT_USER=$USER

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# from bash
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/sbin:/usr/sbin"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/X11/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

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
alias vimdiff='nvim -d'

# git alias
alias gs='git status'
alias gd='git diff'
alias gc='git checkout'
function cd {
    builtin cd "$@" && ls
}

function acp() {
  git add -A
  git commit -m "$1"
  git push
}

# Enable XQuartz display for iTerm
# if [ -z "$DISPLAY" ] && [ -e /tmp/.X11-unix/X0 ]; then
    # export DISPLAY=:0
    # /opt/X11/bin/xhost +localhost >/dev/null 2>&1
# fi

# for fzf
export FZF_DEFAULT_OPTS=''
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export FZF_CTRL_R_OPTS=''

export DAILY_DIR="$HOME/playground/daily"

# Ensure the edit-command-line widget exists
autoload -Uz edit-command-line
zle -N edit-command-line

# Force v in command mode to open Neovim
bindkey -M vicmd v edit-command-line

# Make sure Zsh knows which editor to use
export FCEDIT="nvim"
export EDITOR="nvim"
export VISUAL="nvim"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
