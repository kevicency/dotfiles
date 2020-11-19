# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome
# POWERLEVEL9K_MODE='awesome-patched'

export ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# export ZSH_THEME="agnoster"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# # https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# # https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vi_mode)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(nvm vcs dir_writable history status)
# # colorcode test
# # for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
# POWERLEVEL9K_NVM_FOREGROUND='000'
# POWERLEVEL9K_NVM_BACKGROUND='072'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# POWERLEVEL9K_VI_INSERT_MODE_STRING="❱❱"
# POWERLEVEL9K_VI_COMMAND_MODE_STRING="❰ "
# POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='234'
# POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='002'
# POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='234'
# POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='001'
# POWERLEVEL9K_SHOW_CHANGESET=true
#export ZSH_THEME="random"

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
plugins=(colorize compleat dirpersist autojump git gulp history history-substring-search cp vi-mode yarn vscode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source /usr/local/opt/nvm/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Customize to your needs...
unsetopt correct

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

bindkey '^[[[CA' autosuggest-accept
bindkey '^[[[CE' autosuggest-execute
