#!/bin/sh

if [ $1 = hello ]; then
    echo "$1, english!"
elif [ $1 = shalom ]; then
    echo "$1, hebrew!"
else
    echo "Unknown $1"
fi

# ^ Fires errors if no arguments are given.
# To handle empty parameters use double quotes!
if [ "$1" = non-empty ]; then
    echo "You gave me - $1"
else
    echo "You gave me - $1. Nothing!"
fi
