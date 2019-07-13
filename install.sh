#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    echo "Configuring MacOS"
    ./scripts/installOSX.sh
elif [ "$(uname)" == "Linux" ]; then
    echo "Configuring Linux"
    ./scripts/installLinux.sh
fi
