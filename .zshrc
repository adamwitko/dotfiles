export ZSH=/home/adamwitko/.oh-my-zsh

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
