if [[ -f ~/.cache/wal/sequences ]]; then
  cat ~/.cache/wal/sequences
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [[ -d /home/linuxbrew ]]; then
  export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
fi
export PATH=/var/lib/flatpak/exports/bin:$PATH
export PATH=~/.local/bin:$PATH

if [[ -d $HOME/.oh-my-zsh ]]; then 
  # Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="robbyrussell"
  plugins=(git tmux fzf)
  
  ZSH_TMUX_AUTOSTART=true
  source $ZSH/oh-my-zsh.sh
  
  # User configuration
  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
  else
    export EDITOR='nvim'
  fi
  
  # Compilation flags
  # export ARCHFLAGS="-arch x86_64"
  
fi
if [ -x "$(command -v lsd)" ]; then
  alias ls="lsd"
  alias ll="lsd -l"
fi
if [ -x "$(command -v bat)" ]; then
  alias cat="bat"
fi
if [ -x "$(command -v nvim)" ]; then
  alias vi="nvim"
  alias v="nvim"
else
  alias v="vim"
fi

alias ...='../..'
alias ....='../../..'
