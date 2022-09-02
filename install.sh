#!/bin/sh

# run as:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/Daymannovaes/dotfiles/master/install.sh)"

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install asdf
brew install asdf



DOTPATH=${DOTPATH:-~/dotfiles}
REMOTE=${REMOTE:-https://github.com/Daymannovaes/dotfiles.git}
BRANCH=${BRANCH:-master}

GREEN=$(printf '\033[32m')

install_dot_folder() {
    if [ -d $DOTPATH ]
        then handle_dot_folder
    fi

    git_clone
}

git_clone() {
    git clone --branch "$BRANCH" "$REMOTE" "$DOTPATH" || exit 1
}

handle_dot_folder() {
    echo "dotpath already exists in $DOTPATH"
    echo "do you whish do delete it before proceed? [y/n]"
    read opt

    case $opt in
        y*|Y*|"") echo "Deleting folder..." ;;
        n*|N*) echo "Ok. Doing nothing then."; exit 0 ;;
        *) echo "Invalid choice."; exit 0 ;;
    esac

    rm -rf $DOTPATH
}

install_dot_folder

cp $DOTPATH/.zshrc ~/.zshrc
cp -r $DOTPATH/sh/ ~/sh

echo $GREEN
echo "~/.zshrc created"
echo "additional scripts were put under ~/sh"
echo "dotfiles (installation, configuration and base files) were put under $DOTPATH"
