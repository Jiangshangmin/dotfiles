# Path to your oh-my-zsh configuration.
export EDITOR=vi
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew python docker vagrant go tmux compleat common-aliases pylint tmuxinator)

# Plugin configuration
ZSH_TMUX_AUTOSTART=true

# User configuration
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:$PATH
source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_u25`

# Go
export GOROOT=/usr/local/go
export GOPATH=/Users/tquach/projects/go
export PATH=$GOROOT/bin:$PATH:$GOPATH/bin

# Docker
export DOCKER_IP=$(boot2docker ip 2> /dev/null)
$(boot2docker shellinit 2> /dev/null)

# Python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh
source /usr/local/opt/autoenv/activate.sh

# Aliases
alias docker-rm="docker images | grep none | cut -c 47-59 | xargs docker rmi"
alias docker-rmi='docker images --filter "dangling=true" -q | xargs docker rmi'
alias docker-rme="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm -f"
alias docker-start='docker ps -a -f "status=exited" -q | xargs docker start'
alias zource='source ~/.zshrc'

# SSH with tmux
function ssht {
  case "$2" in
    "") autossh -M 0 $1 -t "if tmux -qu has; then tmux -qu attach; else EDITOR=vim tmux -qu new; fi";;
    *) autossh -M 0 $1 -t "if tmux -qu has -t $2; then tmux -qu attach -t $2; else EDITOR=vim tmux -qu new -s $2; fi";;
  esac
}

# added by travis gem
[ -f /Users/tquach/.travis/travis.sh ] && source /Users/tquach/.travis/travis.sh

export APP_ENV=development
export APP_NODE_ID=tquach.local

unalias rm
