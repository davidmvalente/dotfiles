# David Valente zshrc configurations

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Source all files in the dotfiles
# Alias definition: dotfiles/alias/
# Prompt definition: dotfiles/prompt/
for f in ~/dotfiles/*/*.bash; do source $f; done;

# Random Message of the day
WELCOME_MESSAGES="$HOME/dotfiles/welcome_messages"
lines=("${(@f)$(<${WELCOME_MESSAGES})}")
echo; echo -e "${lines[RANDOM%${#lines[@]}+1]}"