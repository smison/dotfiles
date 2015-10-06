# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i -v"
alias vi='vim'
alias vibash='vim ~/.bashrc'
alias vibashe='vim ~/.bashrc_ext'
alias vibashext='vim ~/.bashrc_ext'
alias vibashp='vim ~/.bash_profile'
alias rebash='source ~/.bashrc'
alias rebashp='source ~/.bash_profile'
alias vimrc='vi ~/.vimrc'
alias hi='history'
alias hg='history | grep'
alias cd..='cd ..'
alias ls='ls --color=auto'
alias gr='grep -r'
alias cbash='cat ~/.bashrc'
alias cbashp='cat ~/.bash_profile'
alias vigit='vi ~/.gitconfig'
alias vissh='vi ~/.ssh/config'
alias lsa='ls -la'
alias dot='cd ~/dotfiles'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'
alias gp='git push'
alias gl='git log'
alias gsh='git show'
alias gb='git branch'
alias gm='git merge'
alias pg='ps aux | grep '
alias hi='history'
alias SKILL='sudo kill -KILL'
alias suni='grep -vl svn | sort | uniq'
alias pu='phpunit'
alias tf='tail -f'

alias ng='sudo netstat -apn | grep' # port番号からprocess名を調べる
alias pysv='python -m SimpleHTTPServer 3000'
alias phpsv='php -S localhost:3000'

HISTSIZE=100000
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';
HISTCONTROL=ignoredups 

alias SKILL='sudo kill -KILL'
alias suni='grep -vl svn | sort | uniq'

PATH="/usr/local/heroku/bin:$PATH"

function javaexec() {
  fname_ext=$1
  fname="${fname_ext%.*}"
  javac $fname_ext
  java  $fname
  echo;
}

# 履歴を記録するcdの再定義（pushdの利用）
function cd {
    if [ -z "$1" ] ; then
        # cd 連打で余計な $DIRSTACK を増やさない
        test "$PWD" != "$HOME" && pushd $HOME > /dev/null
    else
        pushd "$1" > /dev/null
    fi
}

# cdの履歴の中から移動したいディレクトリを選択するcd historyの定義
function cdh {
    local dirnum
    dirs -v | sort -k 2 | uniq -f 1 | sort -n -k 1 | head -n $(( LINES - 3 ))
    read -p "select number: " dirnum
    if [ -z "$dirnum" ] ; then
        echo "$FUNCNAME: Abort." 1>&2
    elif ( echo $dirnum | egrep '^[[:digit:]]+$' > /dev/null ) ; then
        cd "$( echo ${DIRSTACK[$dirnum]} | sed -e "s;^~;$HOME;" )"
    else
        echo "$FUNCNAME: Wrong." 1>&2
    fi
}

#cd履歴を辿るcd backの定義（popdの利用）
function cdb {
    local num=$1 i
    if [ -z "$num" -o "$num" = 1 ] ; then
        popd >/dev/null
        return
    elif [[ "$num" =~ ^[0-9]+$ ]] ; then
        for (( i=0 ; i<num ; i++ )) ; do
            popd >/dev/null
        done
        return
    else
        echo "cdback: argument is invalid." >&2
    fi
}

function cdl {
    local -a dirlist opt_f=false
    local i d num=0 dirnum opt opt_f
    while getopts ":f" opt ; do
        case $opt in
            f ) opt_f=true ;;
        esac
    done
    shift $(( OPTIND -1 ))
    dirlist[0]=..
    for d in * ; do test -d "$d" && dirlist[$((++num))]="$d" ; done
    for i in $( seq 0 $num ) ; do printf "%3d %s%b\n" $i "$( $opt_f && echo -n "$PWD/" )${dirlist[$i]}" ; done
    read -p "select number: " dirnum
    if [ -z "$dirnum" ] ; then
        echo "$FUNCNAME: Abort." 1>&2
    elif ( echo $dirnum | egrep '^[[:digit:]]+$' > /dev/null ) ; then
        cd "${dirlist[$dirnum]}"
    else
        echo "$FUNCNAME: Something wrong." 1>&2
    fi
}

source ~/.bashrc_ext
