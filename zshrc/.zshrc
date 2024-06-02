export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell" # set by `omz`

plugins=(
  git
  nvm
  zsh-autosuggestions
  z
)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# AlIASES
alias v="nvim"
alias ls="ls -lah"
alias pip="python -m pip"
alias whichp="lsof -i -P | grep LISTEN | grep :$PORT"

# ENV VARS
export NPM_TOKEN=""
export CI_JOB_TOKEN=$NPM_TOKEN
export GITLAB_TOKEN=$NPM_TOKEN

export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export DOCKER_HOST=unix:///$HOME/.docker/run/docker.sock

[ -s "$HOME/.docker/init-zsh.sh" ] && source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
export PATH=$(pyenv root)/shims:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' autoload yes
