# Source aliases
source ~/.aliases

# This loop will source each tool in the ~/.tools directory, so that they are always available from the command line
for tool in ~/.tools/*; do
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
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# NVM
export NVM_DIR="/Users/brandonransom/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Prompt styling
autoload -U promptinit; promptinit
prompt pure

