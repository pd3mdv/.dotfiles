#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#export PATH = /home/h4mm3r/.local/bin:$PATH
cat ~/.cache/wal/sequences

alias ll='lsd -l'
alias ls=lsd
alias grep='grep --color=auto'
alias cat=bat
alias rss='russ --database-path ~/Nextcloud/feeds.db'

PS1='[\u@\h \W]\$ '
