# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -alh --color=auto'
    alias dir='dir -alF --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='rg'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias fucking='sudo'

autoload -U +X colors && colors
autoload -U +X promptinit && promptinit
setopt PROMPT_SUBST

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:warnings' format "%B%F{red}I'm sorry Dave, I'm afraid there's no completion:%f %d%b"
setopt completealiases
setopt correctall
# don't allow accidental file over-writes
setopt noclobber

# always pushd when changing a directory
setopt auto_pushd
# use pushd without arguments as 'pushd ~'
setopt PUSHD_TO_HOME

# make keys working the way they should ...
# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# # Use Ctrl+V followed by the key to find these out on a shell
bindkey "^[[H" beginning-of-line # home 
bindkey "^[[F" end-of-line        # end on linux

bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[D" backward-char
bindkey "^[[C" forward-char

# for bash like history navigation
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# use vim as standard editor
export EDITOR=vim

# additions for correct colors in tmux
# export TERM=xterm-256color

# fancy colorful prompt
. ~/.zsh_prompt.zsh

# always attach to running tmux session; sound's like a good idea until you've tried it
#case $- in *i*)
#    if [ -z "$TMUX" ]
#    then
#        tmux attach -dt TMUX || tmux new -s TMUX
#    fi
#esac

alias wetter='curl -H "Accept-Language: de" wttr.in/Nuremberg'

