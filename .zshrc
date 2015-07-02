alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i -v"
alias vi='vim'
alias vibash='vim ~/.bashrc'
alias vibashe='vim ~/.bashrc_ext'
alias vibashext='vim ~/.bashrc_ext'
alias rebash='source ~/.bashrc'
alias vimrc='vi ~/.vimrc'
alias viz='vi ~/.zshrc'
alias vizsh='vi ~/.zshrc'
alias rez='source ~/.zshrc'
alias rezsh='source ~/.zshrc'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# ..で上の階層へ移動
setopt auto_cd

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

source ~/.zshrc_ext
