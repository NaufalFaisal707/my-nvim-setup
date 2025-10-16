#!/usr/bin/env bash

# config
TMUX_CONF="$HOME/.config/nvim/script/tmux.conf"

# add window name
echo -ne "\033]0;LazyVim\007"

# run tmux & nvim as temp program
tmux -f "$TMUX_CONF" -L nvim_$$ new-session "nvim"
