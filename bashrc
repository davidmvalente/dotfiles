# ~/.bashrc: executed by bash(1) for non-login shells.
# David Valente bashrc file.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# # START CUSTOM BASHRC # #
# Source all files in the dotfiles
# Alias definition: dotfiles/alias/
# Prompt definition: dotfiles/prompt/

for f in ~/dotfiles/*/*.bash; do source $f; done;

# Initialise thefuck
# eval "$(thefuck --alias)"

# On SSH login, attach or start new tmux session called `ssh_tmux`
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux new-session -A -s ssh_tmux_david
  exit
fi

# Environment management
export PATH="/home/david/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Display a random inspirational welcome message!
WELCOME_MESSAGES="$HOME/dotfiles/welcome_messages"
echo; echo -e $(shuf -n 1 $WELCOME_MESSAGES);
