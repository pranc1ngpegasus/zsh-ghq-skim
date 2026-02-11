function ghq-skim() {
  local -a sk_cmd

  if command -v sk >/dev/null 2>&1 && sk --help 2>/dev/null | grep -q -- '--tmux'; then
    sk_cmd=(sk --tmux)
  elif command -v sk-tmux >/dev/null 2>&1; then
    sk_cmd=(sk-tmux)
  else
    zle -M "skim command not found (expected sk --tmux or sk-tmux)"
    zle reset-prompt
    return 1
  fi

  local target=$(ghq list --full-path | "${sk_cmd[@]}" --query="$LBUFFER")

  if [ -n "$target" ]; then
    BUFFER="cd ${target}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-skim
bindkey "^g" ghq-skim
