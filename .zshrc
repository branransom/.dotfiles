export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"

# nvm was taking forever to load every time I opened a new shell
export NVM_LAZY_LOAD=true

plugins=(zsh-nvm zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Custom aliases
source ~/.aliases

# This loop will source each tool in the ~/.tools directory and its subdirectories, so that they are always available from the command line
# I am only sourcing *.sh files, since there are README files, make files, etc. includes with some of the tools
for tool in ~/.tools/**/*.sh; do
    source "$tool"
done

# Make cd needless, type `..` to execute `cd ..`
setopt auto_cd

# Enable vim mode in command prompt
bindkey -v
export KEYTIMEOUT=1

export EDITOR='vim'

# History navigation
bindkey '^P' up-history
bindkey '^N' down-history

# Fuzzy finder
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# PyEnv
export PYENV_ROOT=/usr/local/opt/pyenv  
eval "$(pyenv init -)"

# Prompt styling
eval "$(starship init zsh)"

