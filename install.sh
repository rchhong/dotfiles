#!/usr/bin/env bash
echo "$(uname)"
if [ "$(uname)" == "Darwin" ]; then
    echo "Configuring MacOS"
elif [ "$(uname)" == "Linux" ]; then
    echo "Configuring Linux"
fi