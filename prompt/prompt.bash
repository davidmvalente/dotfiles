# Prompt customization
# Setup: curl -fsSL https://starship.rs/install.sh | bash -b $HOME/.local/bin
# Usage: add the [Starship prompt](https://github.com/starship/starship)

# Setup the configuration file
export STARSHIP_CONFIG=$HOME/dotfiles/prompt/starship.toml

# Run the prompt
# Check if the shell is Bash or Zsh and initialize Starship accordingly
if [ -n "$BASH_VERSION" ]; then
    # We're in Bash
    eval "$(starship init bash)"
elif [ -n "$ZSH_VERSION" ]; then
    # We're in Zsh
    eval "$(starship init zsh)"
fi


