# Directories aliases.
# Useful for managing/making/removing directory


# Useful deduplication for dirstack
dedup(){
        declare -a new=() copy=("${DIRSTACK[@]:1}")
        declare -A seen
        local v i
        seen[$PWD]=1
        for v in "${copy[@]}"
        do if [ -z "${seen[$v]}" ]
            then new+=("$v")
                seen[$v]=1
            fi
        done
        dirs -c
        for ((i=${#new[@]}-1; i>=0; i--))
        do      builtin pushd -n "${new[i]}" >/dev/null
        done
}

# Push and pop directories on directory stack
pushd()
{
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi
  builtin pushd "${DIR}" > /dev/null
  dedup
}

pushd_builtin()
{
  builtin pushd > /dev/null
}

popd()
{
  builtin popd > /dev/null
  dedup
}

# Use directory stack by default
alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'

# alias pu='pushd'
# alias po='popd'

alias ...='cd ../..'
alias ....='cd ../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias ll='ls -lahF'
alias la='ls -AF'
alias l='ls -CF'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

