[[ -f "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"

# Automatically start a tmux session if not already in one
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session -s 0
fi

PS1="%{%F{#8ae9fc}%}%~ %{%F{#bd92f8}%}❯%{%f%} " # Prompt visuals

# Aliases
boilerplate() {
  local folder="${1:-main}"
  cp -r ~/boilerplate/"$folder"/{*,.*} . 2>/dev/null
}

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

alias nv='nvim'
alias tm='tmux'
alias lz='lazygit'
alias nodei='node --inspect'
alias nodew='node --watch'
alias nodeiw='node --inspect --watch'
