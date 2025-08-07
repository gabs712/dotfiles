[[ -f "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"

# Automatically start a tmux session if not already in one
command -v tmux &> /dev/null && [ -z "$TMUX" ] && (tmux attach || tmux new-session -s 0)

# ~~~~~~~~~~ Options ~~~~~~~~~~
PS1="%{%F{cyan}%}%~ %{%F{blue}%}❯%{%f%} "

autoload -U colors && colors # Exposes color vars to zsh
command -v dircolors &> /dev/null && eval "$(dircolors -b)" # Sets LS_COLOR values (used on completion)

autoload -U compinit; compinit # Enables completion
zmodload zsh/complist # More completion features

WORDCHARS=${WORDCHARS/\/} # C-w will not delete entire path

# -- History --
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

setopt appendhistory # Appends to history instead of overwriting
setopt sharehistory # Share history between sessions
setopt hist_ignore_space # Don't save when prefixed with space (useful for sensisitive commands)
setopt hist_ignore_dups hist_save_no_dups hist_find_no_dups # Don't save duplicate commands

# -- Completion --
bindkey -M menuselect '^[[Z' reverse-menu-complete # S-Tab binding for consistency
bindkey -M menuselect '\r' .accept-line # Send command without confirming selection

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case insensitive completions
zstyle ':completion:*' menu select # Tab focuses cmp menu
zstyle ':completion:*' special-dirs true # Includes '.' and '..' on completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 'ma=0\;38\;2\;247\;64\;140' # Colorize cmp menu

zle -N smart-tab
smart-tab() { [[ -z ${BUFFER//[[:space:]]/} ]] || zle expand-or-complete }
bindkey '^I' smart-tab # Tab will not have effect on empty lines

# ~~~~~~~~~~ Aliases ~~~~~~~~~~
boilerplate() {
  local folder="${1:-main}"
  cp -r ~/boilerplate/"$folder"/{*,.*} . 2>/dev/null
}

alias ls='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alF --color=auto'

alias nv='nvim'
alias tm='tmux'
alias lz='lazygit'
alias nodei='node --inspect'
alias nodew='node --watch'
alias nodeiw='node --inspect --watch'
