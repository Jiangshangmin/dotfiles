# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias work="cd ~/projects/ && vagrant up && vagrant ssh"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/scala/bin:/Library/PostgreSQL/9.3/share/postgresql/bin
# export MANPATH="/usr/local/man:$MANPATH"
# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_u20`
export MAVEN_HOME=/usr/local/maven

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export GOROOT=/usr/local/go
export GOPATH=/Users/tanquach/projects/go
# export GOPATH=/Volumes/Silvertooth/go
export PATH=$PATH:$GOPATH/bin:$MAVEN_HOME/bin

# Scala
export SCALA_HOME=/usr/local/scala
export PATH=$PATH:$SCALA_HOME/bin

# NSQ
export NSQ_HOME=/usr/local/nsq
export PATH=$PATH:$NSQ_HOME/bin

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/projects
# source /usr/local/bin/virtualenvwrapper.sh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export ORGNAME=crowdsurge
export OPSCODE_USER=tanquach
export EMAIL_ADDRESS=tan.quach@crowdsurge.com
# export AWS_ACCESS_KEY_ID=< your aws access key id>
# # export AWS_SECRET_ACCESS_KEY=<your secret access key>
export SSH_USER=tan
export SSH_KEY=~/projects/chef-ops/.chef/tanquach.pem
export GITHUB_API_KEY=9573f06aea24d61f0933326f8ec4453bebe77727

function sbuild {
  SERVICE=${PWD##*/}
  SERVICEPATH="${HOME}/Crowdsurge/sandbox_data/full/crowdsurge/${SERVICE}/${SERVICE}"
  cp -R config "${SERVICEPATH}/config"
  ( GOOS=linux GOARCH=amd64 go build  -o="${SERVICEPATH}/${SERVICE}" )
}
export -f sbuild
