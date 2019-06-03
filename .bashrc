#
# ~/.bashrc
#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Alias
#alias ls='ls --color=auto'
alias ll='ls -la'
#PS1='[\u@\h \W]\$ '
export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH
