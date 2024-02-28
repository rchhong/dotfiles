function mkcd() {
  if [[ $1 ]] ; then
    mkdir -p $1
    cd $1
  fi
}

function zcmd() {
  alias | grep $1 |awk -F= '{printf "%s\t%s\n", $1, $2}'
}

function rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}

function brew-upgrade-greedy() {
    defaults export com.apple.dock "/tmp/dock-layout.plist"
    $HOMEBREW_PREFIX/bin/brew upgrade --greedy
    defaults import com.apple.dock "/tmp/dock-layout.plist"
    killall Dock
}

function tmux-sessionizer() {
    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(find ~/projects -mindepth 1 -maxdepth 1 -type d | fzf)
    fi

    if [[ -z $selected ]]; then
        exit 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s $selected_name -c $selected
        exit 0
    fi

    if ! tmux has-session -t=$selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
    fi

    tmux switch-client -t $selected_name
}

function create-empty-notebook() {
    temp_file="$1.py"
    notebook="$1.ipynb"
    
    touch $temp_file
    jupytext $temp_file -o $notebook --to notebook --set-kernel $2
    rm $temp_file
}
