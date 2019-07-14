#!/bin/bash
# https://github.com/fearside/ProgressBar/blob/master/progressbar.sh
# Author : Teddy Skarin
function progressBar {
	let _progress=(${1}*100/${2}*100)/100
	let _done=(${_progress}*4)/10
	let _left=40-$_done
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")
	printf "\r${3} Progress : [${_done// /#}${_left// /-}] ${_progress}%%\n"
}

# https://stackoverflow.com/questions/12815774/importing-functions-from-a-shell-script
RUNNING="$(basename $0)"

if [[ "$RUNNING" == "progressBar" ]]
then
  progressBar "$@"
fi
