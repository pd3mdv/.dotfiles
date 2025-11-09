#!/bin/env bash
cd ~/.dotfiles
stow ghostty
stow nvim
if [ ! -d ~/.local/bin/ ]; then
  mkdir -p ~/.local/bin/
fi
stow tmux
stow zsh
