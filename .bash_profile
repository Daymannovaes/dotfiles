source ~/git-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# colors
PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\033[0m\] \$ '

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

alias startmongo='ulimit -n 2048 && mongod'
alias gitpush='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias tenfold-start-dashboard="cd ~/workspace/callinize-node-server && NODE_ENV=production MOCK_ENVIRONMENT=local-db TRANSLATIONS_BUCKET=tenfold-translations-draft node _dashboard/server/dashboard.js --port 3000"
alias tenfold-start-dashboard-2="cd ~/workspace/callinize-node-server && TENFOLD_CONFIG_NAME=production NODE_ENV=production TRANSLATIONS_BUCKET=tenfold-translations-draft node _dashboard/server/dashboard.js --port 3000"
alias tenfold-start-api="cd ~/workspace/callinize-node-server && NODE_ENV=production MOCK_ENVIRONMENT=local-db  node _api/api.js"
alias tenfold-start-api-2="cd ~/workspace/callinize-node-server && TENFOLD_CONFIG_NAME=production NODE_ENV=production node _api/api.js"
alias tenfold-build-ce="~/workspace/callinize-chrome-extension/node_modules/.bin/grunt build-dev"
alias tenfold-build-ce-local="~/workspace/callinize-chrome-extension/node_modules/.bin/grunt build-dev --local"
alias tenfold-tag-ce="ctags -R -f ./.git/tags --exclude=dist --exclude=.tmp --exclude=v2 --exclude=ssl --exclude=src/popup/bower_components ."
alias tenfold-tag-node="ctags --exclude=bin --exclude=docs --exclude=coverage --exclude=config --exclude=ssl --exclude=uploads"
alias tenfold-mongo="mongo callinize --norc"
alias http-server="python -m SimpleHTTPServer"

# ctag all files and put this inside .git folder
alias ctag-project="ctags -R -f ./.git/tags ."

alias vimrc="vim ~/.vimrc"
alias bashprofile="vim ~/.bash_profile"

alias dot-update="cd ~/workspace/dotiles && git pull && cp ~/.bash_profile .bash_profile && cp ~/.vimrc .vimrc && cp ~/.gitignore .gitignore && git commit -nam \"update\" && git push"

alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gdb="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gc="git checkout"
alias gp="git pull"

function tenfold_ofo() {
    open "https://console.firebase.google.com/u/1/project/incandescent-inferno-925/database/incandescent-inferno-925/data/organizations/$1"
}
