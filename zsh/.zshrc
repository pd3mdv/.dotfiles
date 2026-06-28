#if [[ -f ~/.cache/wal/sequences ]]; then
#  cat ~/.cache/wal/sequences
#fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [[ -d /home/linuxbrew ]]; then
  export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
fi
if [[ -d /var/lib/flatpak ]]; then
  export PATH=/var/lib/flatpak/exports/bin:$PATH
  export PATH=~/.local/bin:$PATH
fi

if [[ -d $HOME/.cargo/bin ]]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

if [[ -d $HOME/.cache/wal ]]; then
  cat $HOME/.cache/wal/sequences
fi

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
alias ssht='ssh 192.168.1.12'

if [[ -d $HOME/.config/nvm ]]; then	
  export NVM_DIR="$HOME/.config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

show-at-line () {
  bat --highlight-line $(rg --hidden --line-number "${1:-.}" | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print $2" "$1}')
}

open-at-line () {
  nvim $(rg --hidden --line-number "${1:-.}" | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}
