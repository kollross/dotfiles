# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Check if uname -s output matches "Linux"
if [[ "$(uname -s)" == "Darwin" ]]; then
    source ~/.zsh/aliases_macos.zsh
else
    source ~/.zsh/aliases_linux.zsh
fi

source ~/.zsh/path.zsh



if [[ $EUID -ne 0 ]]; then
    cd ~/dotfiles ; git pull ; cd ~
fi


### Plugins ###

source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
