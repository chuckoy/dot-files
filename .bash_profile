# include bash completion from brew git installation
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
 
# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="True"
 
# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="True"
 
# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="True"
 
# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"

# detect virtual env and assign to variable
if [[ $VIRTUAL_ENV != "" ]]
    then
      # Strip out the path and just leave the env name
      venv="(${VIRTUAL_ENV##*/})"
else
      # In case you don't have one activated
      venv=''
fi

# define colors
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)


# define where virtual envs are being stored (for workon) 
WORKON_HOME=$HOME/.virtualenvs

# ensure all new environments are isolated from the site-packages directory
VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# use the same directory for virtualenvs as virtualenvwrapper
PIP_VIRTUALENV_BASE=$WORKON_HOME

# makes pip detect an active virtualenv and install to it
PIP_RESPECT_VIRTUALENV=true
    if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
        source /usr/local/bin/virtualenvwrapper.sh
    else
        echo "WARNING: Can't find virtualenvwrapper.sh"
    fi


# define aliases

# general aliases
alias g="python manage.py runserver"

# git aliases
alias idgaf="git push --force"
alias up="git pull --rebase --prune $@ && git submodule update --init --recursive" 
alias gs="git status"
alias gd="git diff --color | sed -E "s/^([^-+ ]*)[-+ ]/\\1/" | less -r"
alias gl="git log"
alias gri="git rebase -i"
alias gt="git log --graph --oneline --decorate"

# mac convenience aliases
alias cp="cp -iv"
alias mv="mv -iv"
alias finder="open -a Finder ./"
alias printxrefenv="printenv | grep XREF"

# set the prefix of every prompt
PS1='\[${MAGENTA}\]${venv} \[${YELLOW}\]\w\[${CYAN}\]$(__git_ps1 " {%s}") \[${GREEN}\]>\[\033[0m\] '
