function acp() {
    git add .
    git commit -m $1
    git push
}

function mkcd() {
    mkdir -p $1
    cd $1
}

function zcmd() {
  alias | grep $1 |awk -F= '{printf "%s\t%s\n", $1, $2}'
}