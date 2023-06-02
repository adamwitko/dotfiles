# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export ZSH=/Users/awitko/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
  zsh-auto-nvm-use
)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fmar() {
  git fetch
  git rebase origin/master
}

alias v="nvim"
alias ls="ls -la"
alias grd="cd $(git rev-parse --show-cdup)"
alias pip="python -m pip"
alias dps="cd ~/dev/delivery-promise"
alias whichp="lsof -i -P | grep LISTEN | grep :$PORT"
alias z="zellij"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export NPM_TOKEN="xzMiZyLLy2VCn2PPgA66"
export CI_JOB_TOKEN="xzMiZyLLy2VCn2PPgA66"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/awitko/.sdkman"
[[ -s "/Users/awitko/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/awitko/.sdkman/bin/sdkman-init.sh"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export DOCKER_HOST=unix:///Users/AWitko/.docker/run/docker.sock

source /Users/AWitko/.docker/init-zsh.sh || true # Added by Docker Desktop
export PATH=$(pyenv root)/shims:$PATH

export ZELLIJ_CONFIG_DIR=~/zellij

mkdir ~/.vim/undodir
