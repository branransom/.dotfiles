# Source aliases
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
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Prompt styling
eval "$(starship init zsh)"

# Command suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
