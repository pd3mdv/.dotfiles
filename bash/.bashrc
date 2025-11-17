#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -f ~/.cache/wal/sequences ]]; then
  cat ~/.cache/wal/sequences
fi

#export PATH = /home/h4mm3r/.local/bin:$PATH
if [[ -d /home/linuxbrew ]]; then
  export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
fi
export PATH=/var/lib/flatpak/exports/bin:$PATH
export PATH=~/.local/bin:$PATH

if [[ -x lsd ]]; then
  alias ls="lsd"
  alias ll="lsd -l"
fi
if [[ -x bat ]]; then
  alias cat="bat"
fi
if [[ -x nvim ]]; then
  alias vi="nvim"
  alias v="nvim"
fi

alias ..="cd .."
alias ...='../..'
alias ....="cd ../.."
alias .....='../../..'
alias ......="cd ../../.."
alias .......='../../../..'
alias ........="cd ../../../.."
alias .........='../../../../..'
alias ...........='../../../../../..'

PS1='[\u@\h \W]\$ '
