# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k/p10k.zsh ]] || source ~/.p10k/p10k.zsh
# 1. Define your home-base hostnames in an array
home_hosts=(percival merlin shaolin arch)

# 2. Check if the current $HOST is in that array
if [[ ${home_hosts[(ie)$HOST]} -le ${#home_hosts} ]]; then
    [[ ! -f ~/.p10k/home.zsh ]] || source ~/.p10k/home.zsh
else
    [[ ! -f ~/.p10k/work.zsh ]] || source ~/.p10k/work.zsh
fi



# Check if uname -s output matches "Linux"
if [[ "$(uname -s)" == "Darwin" ]]; then
    source ~/.zsh/aliases_macos.zsh
fi

if [[ "$(uname -s)" == "Linux" ]]; then
    source ~/.zsh/aliases_linux.zsh
fi

if [[ "$(uname -n)" == "truenas" ]]; then
    source ~/.zsh/aliases_truenas.zsh
fi


# Import $PATH

source ~/.zsh/path.zsh


### Do a git pull on certain machines
#if [[ $EUID -ne 0 && $(hostname) =~ ^(shaolin|merlin|percival|NCSA-00143)$ ]]; then
if [[ $EUID -ne 0 ]]; then
    cd ~/dotfiles ; git pull ; cd ~
fi

#### LS_COLORS ####
if [[ -f ~/.dircolors ]]; then
  eval "$(dircolors -b ~/.dircolors)"
fi

### Plugins ###

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#export TERM=xterm-256color
