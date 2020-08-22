# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/Users/waynedu/.oh-my-zsh/"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gitster"

export HISTSIZE=10000

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
         zsh-autosuggestions
		 history-substring-search
         vi-mode)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# remove user@hostname
# export DEFAULT_USER=$USER

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey '^ ' autosuggest-accept

# from bash
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/Library/TeX/texbin/:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CXXFLAGS="-I/usr/local/opt/llvm/include"

alias vi=/usr/bin/vim
alias vim=/usr/local/bin/nvim
alias ctags=/usr/local/bin/ctags
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias llt='ls -lt'
alias lc='ls -l | wc -l'
alias g++='g++ --std=c++11'
alias grep='grep --color=auto'
alias textedit='open -a TextEdit'
alias gitlog='git log --graph --decorate --oneline'

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
