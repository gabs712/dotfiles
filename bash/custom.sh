boilerplate() {
  local folder="${1:-main}"
  cp -r ~/boilerplate/"$folder"/{*,.*} . 2>/dev/null
  git init
}

alias nv='nvim'
alias tm='tmux'
alias lz='lazygit'

alias nodei='node --inspect'
alias nodew='node --watch'
alias nodeiw='node --inspect --watch'

eval "$(starship init bash)"

# Automatically start a tmux session if not already in one
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session -s main
fi

