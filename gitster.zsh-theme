# --- essentials ---
autoload -Uz colors && colors
setopt prompt_subst  # allow $(...) in PROMPT

# --- status arrow (green if last cmd OK, red otherwise) ---
# ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

# --- repo-relative path helper ---
get_pwd() {
  local git_root=$PWD
  while [[ $git_root != / && ! -e "$git_root/.git" ]]; do
    git_root=${git_root:h}
  done
  local prompt_short_dir
  if [[ $git_root = / ]]; then
    prompt_short_dir=%~
  else
    local parent=${git_root%/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  print -r -- "$prompt_short_dir"
}

# --- git branch color helper ---
git_info() {
  # Return if not in a Git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Get current branch name or short hash
  local branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
                || git rev-parse --short HEAD 2>/dev/null)

  local color
  # Detect status for color
  if ! git diff --quiet --ignore-submodules --exit-code 2>/dev/null; then
    color=$fg[red]          # unstaged changes
  elif ! git diff --cached --quiet --ignore-submodules --exit-code 2>/dev/null; then
    color=$fg[yellow]       # staged changes
  else
    color=$fg[green]        # clean
  fi

  print -n "%{$color%}[$branch] %{$reset_color%}"
}

# --- final prompt ---
# clean, simple, color-coded git branch
PROMPT='%{$fg[white]%}$(get_pwd)%{$reset_color%} $(git_info)>> '

