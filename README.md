# dotfiles

- Install brew

## Install
#### automatically
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Daymannovaes/dotfiles/master/install.sh)"
```

- then install szh plugins
- then install vim plugins

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Manually
```
  git clone git@github.com:Daymannovaes/dotfiles.git ~/workspace/dotfiles
  cd ~/workspace/dotfiles
  
  mv .zhrc ~/.zhrc
  mv sh/ ~/sh/
```

## Usage

Simply start a new terminal and you're good to go

To see the `~/.zshrc` simply run `zshrc`. To see the list of all available aliases, simply run `aliases`

## Update

After you change any dotfile (`.vimrc`, or `.zshrc` for example), simply run `dot-update` in your terminal and those changes will be updated to the cloud
