# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias rm='rm -i'

alias vi='vim'
alias vibash='vim ~/.bashrc'
alias vibashext='vim ~/.bashrc_ext'
alias rebash='source ~/.bashrc'
alias vimrc='vi ~/.vimrc'

alias cdt='cd /var/tmp'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

# User specific aliases and functions
alias hi='history'
alias hg='history | grep'
alias cd..='cd ..'
alias rm='rm -i'
alias r='ruby'
alias re='ruby -e'
alias be='bundle exec'
alias gr='grep -r'
alias cbash='cat ~/.bashrc'
alias cbashp='cat ~/.bash_profile'
alias vish='vi ~/.bashrc'
alias vb='vi ~/.bashrc'
alias vibash='vi ~/.bashrc'
alias vishp='vi ~/.bash_profile'
alias vibashp='vi ~/.bash_profile'
alias resh='source ~/.bashrc'
alias rb='source ~/.bashrc'
alias rebash='source ~/.bashrc'
alias reshp='source ~/.bash_profile'
alias rebashp='source ~/.bash_profile'
alias vigit='vi ~/.gitconfig'
alias vissh='vi ~/.ssh/config'
alias vimrc='vi ~/.vimrc'
alias vivimrc='vi ~/.vimrc'
alias lsa='ls -la'
alias cdtest='cd /var/tmp/test'
# git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias gp='git push'
alias gl='git log'
alias gsh='git show'
alias gb='git branch'
alias gch='git checkout'
alias gm='git merge'
#alias gr='git remote -v'
alias grv='git remote -v'
# ps aux | grep *
alias pg='ps aux | grep '
# super short
alias l='ls'
# history
alias hi='history'
HISTSIZE=100000
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';
# SKILL
alias SKILL='sudo kill -KILL'
# sort & uniq & remove svn
alias suni='grep -vl svn | sort | uniq'

PATH="/usr/local/heroku/bin:$PATH"

function javaexec() {
  fname_ext=$1
  fname="${fname_ext%.*}"
  javac $fname_ext
  java  $fname
  echo;
}

source ~/.bashrc_ext
