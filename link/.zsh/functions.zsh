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
