#!/bin/sh

set -x

if [ $1 = hello ]; then
    echo "$1, english!"
elif [ $1 = shalom ]; then
    echo "$1, hebrew!"
else
    echo "Unknown $1"
fi


# ^ Fires errors if no arguments are given.
# To handle empty parameters use double quotes!
if [ "$1" ]; then
    echo "You gave me - $1"
else
    echo "You gave me - $1. Nothing!"
fi


# If we want to compare variables
if [ "$1" = "$2" ]; then
    echo "$1 and $2 match!"
fi


# Logical OR
if [ "$1" = 3 ] || [ "$1" = 5 ]; then
    echo "I'm a psychic!"
fi


# Logical AND
if [ "$2" ]  && [ "$2" ]; then
    echo "I received two arguments"
fi


# Pattern-matching case conditional
read INPUT

case $INPUT in
    potato)
        echo "Salad!"
        ;;
    chunky|bacon)
        echo "Chunky bacon!"
        ;;
    *)
        echo "Que?"
        ;;
esac
