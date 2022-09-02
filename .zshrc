# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- SZH specifics, such as theming and oh-my-zsh
source ~/sh/.zsh-config

# ---- environment configs, such $PATH, EDITOR, HISTORY end NVM
source ~/sh/.shell-config

source ~/sh/.android-config

source ~/sh/.tenfold
source ~/sh/.mindsciences
source ~/sh/.aliases

# disabled because it slows down all "cd" commands
# source ~/sh/nvm-auto-switch.sh
# nvm_auto_switch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
