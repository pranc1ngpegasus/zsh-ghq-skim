function ghq-skim() {
  local target=$(ghq list --full-path | sk-tmux --query="$LBUFFER")

  if [ -n "$target" ]; then
    BUFFER="cd ${target}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-skim
bindkey "^g" ghq-skim
