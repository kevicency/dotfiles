# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome
# POWERLEVEL9K_MODE='awesome-patched'

export ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="false"

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colorize compleat dirpersist autojump git gulp history history-substring-search cp vi-mode yarn vscode zsh-autosuggestions kubectl thefuck dotenv pass direnv docker docker-compose)

source $ZSH/oh-my-zsh.sh

source /usr/local/opt/nvm/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  else
    nvm use stable &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Customize to your needs...
unsetopt correct

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"
export PATH="~/.local/bin:$PATH"
# export PATH="$PATH:/Users/kev/.dotnet/tools"

bindkey '^@' autosuggest-accept
# bindkey '^M' autosuggest-execute
bindkey '\x1e\x58' autosuggest-execute

bindkey '^[[[CA' autosuggest-accept
bindkey '^[[[CE' autosuggest-execute

eval $(gdircolors)

alias rmrf="rm -rf"
alias lg="lazygit"
alias kit="lazygit"
alias -g G="| grep"
alias -g L="| less"

[[ ! -f ~/.local.zsh ]] || source ~/.local.zsh

export GPG_TTY=$(tty)

alias godot='/Applications/Godot.app/Contents/MacOS/Godot'
alias gut='godot --debug-collisions --path $PWD -d -s addons/gut/gut_cmdln.gd'
alias kl='python3 ~/code/benign-key-logger/key_logger.py'

export DOTNET_ROOT="/usr/local/share/dotnet"
# export MSBuildSDKsPath="$DOTNET_ROOT/sdk/3.1.416/Sdks"
# pnpm
export PNPM_HOME="/Users/kev/Library/pnpm"
export PATH="$PNPM_HOME:$DOTNET_ROOT:$PATH"
# pnpm end

alias p='pnpm'