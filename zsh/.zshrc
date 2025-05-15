# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# Set theme to lambda
ZSH_THEME="rgm" # set by `omz`

# Enable plugins
plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Source Oh My Zsh configuration
source $ZSH/oh-my-zsh.sh

#For automatic theme changing using pywal
# Pywal color scheme
[[ -f "${HOME}/.cache/wal/colors.zsh" ]] && source "${HOME}/.cache/wal/colors.zsh"

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts --no-title -s -r

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

# Set history options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# Customizing zsh-syntax-highlighting colors
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]="fg=$color4"
ZSH_HIGHLIGHT_STYLES[option]="fg=$color4"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$color3"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=$color5"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$color3"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$color3"


