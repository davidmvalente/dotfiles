# Prompt customization
# Setup: curl -fsSL https://starship.rs/install.sh | bash -b $HOME/.local/bin
# Usage: add the [Starship prompt](https://github.com/starship/starship)

# Setup the configuration file
export STARSHIP_CONFIG=$HOME/dotfiles/prompt/starship.toml

# Run the prompt
eval "$($HOME/.local/bin/starship init bash)"


