if [[ -o interactive ]]; then
  # Cache uv completions — regenerate weekly or on cache miss
  _uv_completion_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/uv_completion.zsh"

  if [[ ! -f "$_uv_completion_cache" ]] || ! zstat -F '%s' +mtime -- "$_uv_completion_cache" 2>/dev/null | read -r _ts || (( EPOCHSECONDS - _ts > 604800 )); then
    mkdir -p "${_uv_completion_cache:h}"
    uv generate-shell-completion zsh >| "$_uv_completion_cache"
  fi
  source "$_uv_completion_cache"
  unset _uv_completion_cache _ts
fi
