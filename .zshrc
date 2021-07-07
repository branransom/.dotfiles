export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"

# nvm was taking forever to load every time I opened a new shell
export NVM_LAZY_LOAD=true

# darker color for autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

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
export PYENV_ROOT="/usr/local/opt/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Prompt styling
eval "$(starship init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/n0251082/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/n0251082/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/n0251082/opt/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/n0251082/opt/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

