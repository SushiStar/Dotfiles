#!/usr/bin/env zsh

# Check if tmux session "hello" already exists
if ! tmux has-session -t hello 2>/dev/null; then
    # Create a new session called "hello" (detached)
    tmux new-session -d -s hello

    # Create a second window
    tmux new-window -t hello:2

    # Split the second window vertically
    tmux split-window -h -t hello:2

    # Select the first window by default
    tmux select-window -t hello:1
fi

# Attach to the session (or switch to it if already inside tmux)
if [ -z "$TMUX" ]; then
    tmux attach-session -t hello
else
    tmux switch-client -t hello
fi
