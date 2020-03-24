export ZSH=/home/adamwitko/.oh-my-zsh

ZSH_THEME="wezm"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#/usr/local/opt/asdf/asdf.sh
#. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
#. /home/adamwitko/.asdf/asdf.sh

function fmar() {
  git fetch
  git rebase origin/master
}

alias v="nvim"
alias ls="ls -la"
export GPG_TTY=`tty`
