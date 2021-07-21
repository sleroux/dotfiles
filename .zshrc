# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/stephanleroux/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Terminal Settings

export DEFAULT_USER=sleroux

# ------- Aliases

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
alias gopen="hub browse"
alias gcomp="hub compare"

# Aliases - Terminal/tmux

alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias ta='tmux attach -t'
alias tls='tmux list-sessions'
alias tn='tmux new-session -s'

# ------- Nix
NIX_LINK=$HOME/.nix-profile

# Append ~/.nix-defexpr/channels to $NIX_PATH so that <nixpkgs>
# paths work when the user has fetched the Nixpkgs channel.
export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels

# Set up environment.
# This part should be kept in sync with nixpkgs:nixos/modules/programs/environment.nix
export NIX_PROFILES="/nix/var/nix/profiles/default $HOME/.nix-profile"

# Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
if [ -e /etc/ssl/certs/ca-certificates.crt ]; then # NixOS, Ubuntu, Debian, Gentoo, Arch
    export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
elif [ -e /etc/ssl/ca-bundle.pem ]; then # openSUSE Tumbleweed
    export NIX_SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
elif [ -e /etc/ssl/certs/ca-bundle.crt ]; then # Old NixOS
    export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
elif [ -e /etc/pki/tls/certs/ca-bundle.crt ]; then # Fedora, CentOS
    export NIX_SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt
elif [ -e "$NIX_LINK/etc/ssl/certs/ca-bundle.crt" ]; then # fall back to cacert in Nix profile
    export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ssl/certs/ca-bundle.crt"
elif [ -e "$NIX_LINK/etc/ca-bundle.crt" ]; then # old cacert in Nix profile
    export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ca-bundle.crt"
fi

if [ -n "${MANPATH-}" ]; then
    export MANPATH="$NIX_LINK/share/man:$MANPATH"
fi

export PATH="$NIX_LINK/bin:$PATH"

if [ -e /Users/stephanleroux/.nix-profile/etc/profile.d/nix.sh ]; then
    . /Users/stephanleroux/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"