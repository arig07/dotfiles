# Initialize shell prompt instantly
[ -r "$P10K_INSTA_PROMPT" ] && source "$P10K_INSTA_PROMPT"

# Configure shell history
HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
HISTSIZE=12000
SAVEHIST=10000

# Re-initialize PATH and FPATH in new tmux sessions
source "$ZDOTDIR/.zprofile"

# Initialize secrets
[ -f "$HOME/.dotfiles/.env" ] && source "$HOME/.dotfiles/.env"

# Configure colorscheme: ls, tree, eza
eval "$(gdircolors "$XDG_CONFIG_HOME/eza/.dircolors")"

# Configure shell options
setopt "$ZOPTS[@]" 

# Lazy load shell user functions
for fn in "$ZDOTDIR/functions/"*; do autoload -Uz "$(basename "$fn")"; done

# Initialize shell core plugins: auto-complete, auto-pair, auto-suggestions, syntax-highlighting
for plug in "$ZPLUGS[@]"; do source "$(brew --prefix)/share/zsh-$plug/$plug.zsh"; done

# Configure shell aliases, completions, syntax-highlighting
for cnf in "$ZCONFIGS[@]"; do source "$ZDOTDIR/configs/$cnf"; done

# Initialize & configure shell prompt theme
source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" && source "$ZDOTDIR/themes/.p10k.zsh"

# Initialize & configure fuzzy finder
source <(fzf --zsh) && source "$XDG_CONFIG_HOME/fzf/config.sh"

# Initialize & configure shell history manager
eval "$(atuin init zsh)" && { bindkey '^e' atuin-search; bindkey '^[[A' atuin-up-search }

# Initialize shell authentication manager: 1p -> gh
source "$XDG_CONFIG_HOME/op/plugins.sh"

# Initialize & configure shell working directory manager
eval "$(lua "$(brew --prefix)/share/z.lua/z.lua" --init zsh enhanced once)"
