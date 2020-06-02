export ZSH=/Users/awitko/.oh-my-zsh
ZSH_THEME="wezm"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fmar() {
  git fetch
  git rebase origin/master
}

function vpn-connect {
  echo "Connecting to $1"
  sudo openconnect -b $1
}

function vpn-disconnect {
	echo "Disconnecting..."
	sudo pkill -SIGINT openconnect
}

alias v="nvim"
alias ls="ls -la"
alias yip="yarn install --pure-lockfile"
export GPG_TTY=`tty`
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/awitko/.sdkman"
[[ -s "/Users/awitko/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/awitko/.sdkman/bin/sdkman-init.sh"
