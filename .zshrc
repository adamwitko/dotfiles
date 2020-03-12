export ZSH=/Users/adamwitko/.oh-my-zsh

ZSH_THEME="wezm"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/opt/mongodb@3.4/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin/python3:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/adamwitko/dev/ec2-backups/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/adamwitko/dev/ec2-backups/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/adamwitko/dev/ec2-backups/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/adamwitko/dev/ec2-backups/node_modules/tabtab/.completions/sls.zshexport PATH="/usr/local/opt/mongodb@3.6/bin:$PATH"
export PATH="/usr/local/opt/mongodb@3.6/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/adamwitko/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/adamwitko/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/adamwitko/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/adamwitko/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/opt/asdf/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

function use-azure-production() {
  az account set --subscription fbaf2db7-e1bb-4bcd-a251-1e1aefa57ba1
  echo "Updated az to use the Production subscription."
}

function use-azure-development() {
  az account set --subscription f2aebae0-a296-42c3-a14f-41c1a395d3a7
  echo "Updated az to use the Development subscription."
}

function fmar() {
  git fetch
  git rebase origin/master
}

alias v="nvim"
alias ls="ls -la"
alias po="lsof -nP -i4:$1| grep LISTEN"
export GPG_TTY=`tty`
