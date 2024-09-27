source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

alias ls=colorls

source /opt/homebrew/Cellar/zsh-autocomplete/24.09.04/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export EDITOR=nvim
eval "$(tmuxifier init -)"
