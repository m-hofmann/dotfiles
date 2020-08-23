#! /bin/zsh

function exists_hg_repo() {
    hg status > /dev/null 2>&1
    return $?
}

function exists_git_repo() {
    git status > /dev/null 2>&1
    return $?
}

function test_repo() {
    SYMBOL="undefined"
    BRANCH="no branch"
    if exists_hg_repo
    then
        SYMBOL="☿"
        BRANCH=$(hg branch 2> /dev/null | tail -n1)
    elif exists_git_repo
    then
        SYMBOL="±"
        BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    else 
        echo "" # no repository of any kind found, do not print that string
        return
    fi

    echo "on %F{green}$SYMBOL%F{yellow}$BRANCH %f"
}

function set_prompt() {
    command_retval=$? # must come first to avoid modifying $? by setting variables

    LOCATION=$(echo "[%F{yellow}%n@%m%f] in %F{blue}%3~%f $(test_repo) %f")
    if [[ $command_retval == 0 ]]
    then
        # green checkmark
        RETVAL="%F{green}"
        RETVAL+=$(printf "\342\234\223 %3d"  $command_retval)
    else
        # red x 
        RETVAL="%F{red}"
        RETVAL+=$(printf "\342\234\227 %3d"  $command_retval)
    fi

    echo "$LOCATION\n$RETVAL%f $ "
}

PS1='$(set_prompt)'

