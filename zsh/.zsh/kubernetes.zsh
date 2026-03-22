if [[ -o interactive ]]; then
  # Cache kubectl completions — regenerate weekly or on cache miss
  _kubectl_completion_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/kubectl_completion.zsh"

  if [[ ! -f "$_kubectl_completion_cache" ]] || ! zstat -F '%s' +mtime -- "$_kubectl_completion_cache" 2>/dev/null | read -r _ts || (( EPOCHSECONDS - _ts > 604800 )); then
    mkdir -p "${_kubectl_completion_cache:h}"
    kubectl completion zsh >| "$_kubectl_completion_cache"
  fi
  source "$_kubectl_completion_cache"

  # 'k' uses k8s autocomplete (zsh-native, no bashcompinit needed)
  compdef k=kubectl
  unset _kubectl_completion_cache _ts
fi