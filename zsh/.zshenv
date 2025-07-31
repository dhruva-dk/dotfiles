# 1password SSH
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock


eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 


# Added by Toolbox App
export PATH="$PATH:/Users/dk/Library/Application Support/JetBrains/Toolbox/scripts"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


export EDITOR='code -w'