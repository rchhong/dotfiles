function rga-fzf --description "Search file contents with rga and open with fzf"
    set RG_PREFIX "rga --files-with-matches"
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[1]'" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
                --phony -q "$argv[1]" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview-window="70%:wrap"
    )
    if test -n "$file"
        echo "opening $file"
        open "$file"
    end
end
