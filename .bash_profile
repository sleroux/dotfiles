export GPG_TTY=$(tty)

# Terminal Settings

DEFAULT_USER=sleroux

# Git autocomplete 
source ~/.git-completion.bash
 
# Aliases - GIT
 
alias gsweep="git branch --merged develop | grep -v \"\\* develop\" | xargs -n 1 git branch -d"
alias gs="git status"
alias gm="git merge"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gc="git commit"
alias gaa="git add ."
alias gf="git fetch"
alias gpo="git pull origin"
alias gmt="git mergetool"
alias gpu="git push origin"
alias v="mvim -v"
 
# Aliases - Terminal
 
alias gopen="hub browse"

function _update_ps1() {
    PS1="$(~/development/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
#export PATH="/Applications/Unity/Unity.app/Contents/Mono/bin:$PATH"

eval "$(rbenv init -)"

# Tiny Care Terminal ENV vars
export TTC_SAY_BOX=mario
export TTC_REPOS=~/development/unity-buy-sdk,~/development/lastronaut-unity
export TTC_GITBOT=gitlog
export TTC_WEATHER=Toronto
export TTC_CONSUMER_KEY=ysjM2OkOjFwiLjdTTyIpGs3ma
export TTC_CONSUMER_SECRET=ZFrOf9A257VrK0g7hC3s4EaWGWUQqUxvcUIeMPSpUANoLR5L8B
export TTC_ACCESS_TOKEN=162929479-l2oA9YoykEKQfS6xXVnta3T46bCRSDg9I08T1xwF
export TTC_ACCESS_TOKEN_SECRET=ht0oJYxbxppF8RbQ0UnykxMPoYZTyXW5TThhezKiYd3jN

