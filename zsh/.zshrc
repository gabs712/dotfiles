[[ -f "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"

# Automatically start a tmux session if not already in one
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session -s 0
fi
