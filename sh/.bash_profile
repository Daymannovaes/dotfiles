source ~/git-completion.bash

#PATH EXPORTS
NODE_MODULES=$HOME/.npm
NPM_PACKAGES=$HOME/.npm-global/bin
GIT_FLOW=$HOME/workspace/sindi
export PATH=$PATH:$HOME/bin:$NODE_MODULES:$NPM_PACKAGES:$GIT_FLOW:/Users/daymannovaes/workspace

#NVM ENABLE
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/sh/nvm-auto-switch.sh
nvm_auto_switch

# colors
PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\033[0m\] \$ '

# set VIM to edit git merge
export VISUAL=vim
export EDITOR="$VISUAL"

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

alias startmongo='ulimit -n 2048 && mongod --dbpath ~/data/db'
alias gpusho='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gpush='git push'
alias tenfold-start-dashboard="cd ~/workspace/callinize-node-server && TENFOLD_CONFIG_NAME=development node _dashboard/server/dashboard.js --port 3000"
alias tenfold-start-api="cd ~/workspace/callinize-node-server && TENFOLD_CONFIG_NAME=development node _api/api.js"
alias tenfold-start-worker="cd ~/workspace/callinize-node-server && TENFOLD_CONFIG_NAME=development node _scheduler/scheduler.js"
alias tenfold-build-ce="~/workspace/callinize-chrome-extension/node_modules/.bin/grunt build-dev"
alias tenfold-build-ce-local="~/workspace/callinize-chrome-extension/node_modules/.bin/grunt build-dev --local"
alias tenfold-tag-ce="ctags -R -f ./.git/tags --exclude=dist --exclude=.tmp --exclude=v2 --exclude=ssl --exclude=src/popup/bower_components ."
alias tenfold-tag-node="ctags --exclude=bin --exclude=docs --exclude=coverage --exclude=config --exclude=ssl --exclude=uploads"
alias tenfold-mongo="mongo callinize --norc"
alias tenfold-elastic="docker run -d --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:5.5.0-alpine"
alias http-server="python -m SimpleHTTPServer"

# ctag all files and put this inside .git folder
alias ctag-project="ctags -R -f ./.git/tags ."

alias vimrc="vim ~/.vimrc"
alias bashprofile="vim ~/.bash_profile"
alias tmuxrc="vim ~/.tmux.conf"
alias tmux-update="tmux source-file ~/.tmux.conf"

alias dot-update="cd ~/workspace/dotiles && git pull && cp ~/.bash_profile .bash_profile && cp ~/.vimrc .vimrc && cp ~/.gitignore .gitignore && cp ~/.tmux.conf .tmux.conf && cp ~/sh/nvm-auto-switch.sh nvm-auto-switch.sh && git add --all && git commit -m \"update\" && git push"

alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gl="git log"
alias gdb="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gco="git checkout"
alias gcm="git commit"
alias gp="git pull"
alias gcp="git cherry-pick"

function tenfold_ofo() {
    open "https://console.firebase.google.com/u/1/project/incandescent-inferno-925/database/incandescent-inferno-925/data/organizations/$1"
}
