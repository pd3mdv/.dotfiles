#!/usr/bin/env bash
if [ -f /etc/arch-release ]; then
  pacman -Syu --noconfirm git zsh wget tmux stow neovim nvm ripgrep fzf lsd bat base-devel stylua
else
  echo "Unsupported OS"
  exit 1
fi
