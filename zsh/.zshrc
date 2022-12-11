# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_EXTRA_CA_CERTS="~/RootCA_01.pem"

# Loads NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

nvm use v18.7.0

export ZSH=$HOME/.oh-my-zsh


# ZSH
ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX="true"
UPDATE_ZSH_DAYS=30
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


mkd () {
    mkdir -p "$@" && cd "$@"
}

killport () {
    lsof -t -i tcp:"$@" | xargs kill
}

playwright-install () {
    HTTPS_PROXY=http://"$@" npx playwright install
}

weather () {
    curl wttr.in/"$@"
}

# ###########
# # ALIASES #
# ###########

alias zrc="code ~/dotfiles/zsh/.zshrc"
alias dot="cd ~/dotfiles && code ."
alias dotfiles="cd ~/dotfiles"

# # Easier navigation: .., ..., ...., .....

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# # Shortcuts

alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias work="cd ~/Work"
alias dev="cd ~/Dev"

alias banking="cd ~/Work/web-banking"
alias proxy="cd ~/Work/package-web-proxy"

alias cls="clear"
alias g="git"
alias stash="git stash"
alias pop="git stash pop"
alias status="git status"
alias develop="git checkout develop && git fetch --all && git pull"
alias push-force="git push --force-with-lease --no-verify"
# alias squash="g reset $(g merge-base develop $(g branch --show-current))"
alias linkls="( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l"

alias ip="netstat -rn | grep default"

# # Kill all the tabs in Chrome to free up memory
# # [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

eval $(ssh-agent)
ssh-add ~/.ssh/dev/github
ssh-add ~/.ssh/work/gitlab


source $ZSH/oh-my-zsh.sh

clear

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
