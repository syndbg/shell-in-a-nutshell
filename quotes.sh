#!/bin/sh

# Variables are expanded
echo 1 No one saves us but ourselves. No one can and no one may. We ourselves must walk the $PATH.
echo 2 "No one saves us but ourselves. No one can and no one may. We ourselves must walk the $PATH."


# But not with single-quotes!
echo 3 'No one saves us but ourselves. No one can and no one may. We ourselves must walk the $PATH.'


# As expected, you can escape characters just like in other languages with a backslash
echo 'You cannot \tescape\nthe responsibility of tomorrow by evading it today.'
