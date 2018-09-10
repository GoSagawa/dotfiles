export LC_ALL=ja_JP.UTF-8

PROMPT="%F{cyan}[%~]%f %# "

#prevent Ctrl+D logout
setopt IGNOREEOF

#comp
autoload -Uz compinit
compinit

#history
setopt share_history
setopt histignorealldups
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

#common setting
alias updatedb='sudo /usr/libexec/locate.updatedb'
export PATH=$PATH:$HOME/dotfiles/bin
export EDITOR=/usr/local/bin/vim
export SHELL=/usr/local/bin/zsh

#docker
alias dlog='docker logs'
alias dlogf='docker logs -f'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dim='docker images'
alias drm='docker rm $(docker ps -aqf "status=exited") 2> /dev/null'
alias dirm='docker rmi $(docker images -aqf "dangling=true") 2> /dev/null'
alias dc='docker-compose'
alias dcrun='dc run --service-ports'
function dcrm() {
    dc stop $1 && dc rm -f $1
}
function dreslogf() {
    docker restart $1 && dlogf $1
}

#golang
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#tmux
[[ -s /Users/gsagawa/.tmuxinator/scripts/tmuxinator ]] && source /Users/gsagawa/.tmuxinator/scripts/tmuxinator

_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _describe -t commands "tmuxinator subcommands" commands
    _describe -t projects "tmuxinator projects" projects
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start)
        _arguments '*:projects:($projects)'
      ;;
    esac
  fi

  return
}

compdef _tmuxinator tmuxinator mux
alias mux="tmuxinator"

#ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#load localseting
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

#peco,ghq setting
function peco-ghq-cd () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        selected_dir="`ghq root`/$selected_dir"
        BUFFER="cd ${selected_dir}"
    fi
    zle clear-screen
}
zle -N peco-ghq-cd
bindkey '^f' peco-ghq-cd
