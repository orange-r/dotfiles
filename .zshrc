# You may need to manually set your language environment
export LANG=en_US.UTF-8

if [ "$LS_COLORS" -a -f /etc/DIR_COLORS ]; then
  eval $(dircolors /etc/DIR_COLORS)
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# golang
export GOPATH=$HOME/go
export GOROOT=$( go env GOROOT )
export PATH=$GOPATH/bin:$PATH

# Docker
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

########
# util #
########
bindkey -e
#
# # 補完機能
autoload -Uz compinit
compinit

# Created by newuser for 5.4.2
fpath=(/usr/local/share/zsh-completions/src $fpath)

# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "plugins/git", from:oh-my-zsh
# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "zsh-users/zsh-syntax-highlighting"

# コマンド履歴から補完
zplug "zsh-users/zsh-autosuggestions"
# 補完の強化
zplug "zsh-users/zsh-completions"
# コマンドのシンタックスハイライト
zplug "zsh-users/zsh-syntax-highlighting"
# 履歴の検索
zplug "zsh-users/zsh-history-substring-search"
# 移動系強化プラグイン
zplug "b4b4r07/enhancd", use:init.sh
# dockerコマンド補完
# zplug "docker/cli", use:"contrib/completion/zsh/_docker"

# PowerLine系
zplug "powerline/powerline", use:powerline/bindings/zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# eval `dircolors /etc/DIR_COLORS`
# autoload -U colors
# colors
# zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
# cdを使わずにディレクトリを移動できる
setopt auto_cd
# "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
# コマンドの打ち間違いを指摘してくれる
# setopt correct

##############################
# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=500000
# 同じコマンドをヒストリに保存しない
setopt hist_ignore_all_dups
# 無駄なスペースを消してヒストリに保存する
setopt hist_reduce_blanks
# ヒストリを共有
setopt share_history

########################
# alias
alias ls="colorls -a --sd"
alias la='ls'
alias ll='ls -l'

alias vzrc='vim ~/.zshrc'
alias vvrc='vim ~/.vimrc'

alias fgrep='find_grep'
alias ggrep='git grep -n'

# vagrant
alias vu='vagrant up'
alias vh='vagrant halt'
alias vr='vagrant reload'
alias vs='vagrant ssh'

# golang
alias cd-go-src='cd $GOPATH/src'

######################
# function
function find_grep(){
  # find $1 -type f | egrep -v ".js|.swp|.png" | xargs grep $2 --color=auto -n
  # find $1 -type f | egrep -v ".js|.css|.swp|.png|.log" | xargs grep $2 --color=auto -n
  find $1 -type f | egrep -v ".swp|.png" | xargs grep $2 --color=auto -n
}
alias codegrep='find . -path ./.git -prune -o -path ./log -prune -o -type f -print0 | xargs -0 grep -n -E $1'


function ls-color(){
  for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
}

######################
# zstyle
zstyle ':completion:*' list-colors "${LS_COLORS}" # 補完候補のカラー表示

#######################
# PowerLine
# function powerline_precmd() {
#     PS1="$(powerline-shell --shell zsh $?)"
# }
#
# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }
#
# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_TIME_FORMAT="%D{%m\/%d %H:%M}"
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_BACKGROUND='background'

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u25B8 "

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

# # インクリメンタルからの検索
# bindkey "^R" history-incremental-search-backward
# bindkey "^S" history-incremental-search-forward

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# export PATH="/usr/local/opt/openssl/bin:$PATH"
# export PATH="/usr/local/opt/sqlite/bin:$PATH"
