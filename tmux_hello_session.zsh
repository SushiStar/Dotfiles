#!/usr/bin/env zsh

# Check if tmux session "hello" already exists
if ! tmux has-session -t hello 2>/dev/null; then
    tmux new-session -d -s hello -n vim
    # tmux send-keys -t hello:0 'echo "Welcome to the hello session"' C-m
    echo "Created hello session"

    tmux new-window -n cmd
    tmux split-window -h -t cmd
fi

# Attach to the session (or switch to it if already inside tmux)
# if [ -z "$TMUX" ]; then
    # tmux attach-session -t hello
# else
    # tmux switch-client -t hello
# fi


# Automatically create tmux sessions
# if command -v tmux &>/dev/null; then
    # tmux_create_sessions
# fi
