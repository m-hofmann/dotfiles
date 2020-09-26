emulate sh
. ~/.profile
[ -f ~/.secrets ] && . ~/.secrets
emulate zsh

source <(doctl completion zsh)

