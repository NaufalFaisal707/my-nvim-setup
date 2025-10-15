#!/usr/bin/env bash

SESSION_NAME="nvim"
TMUX_CONF="$HOME/.config/nvim/script/tmux.conf"

cleanup() {
    local clients
    clients=$(tmux -f "$TMUX_CONF" list-clients -t "$SESSION_NAME" 2>/dev/null | wc -l)

    if [[ "$clients" -le 1 ]]; then
        tmux -f "$TMUX_CONF" kill-session -t "$SESSION_NAME" 2>/dev/null
    fi

    exit 0
}

trap cleanup SIGINT SIGTERM EXIT

if tmux -f "$TMUX_CONF" has-session -t "$SESSION_NAME" 2>/dev/null; then
    tmux -f "$TMUX_CONF" attach-session -t "$SESSION_NAME"
else
    tmux -f "$TMUX_CONF" new-session -s "$SESSION_NAME"
fi
