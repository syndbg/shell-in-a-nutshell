#!/bin/sh

for filename in *; do
    file $filename
done


n=5
while [ $n -gt 0 ]; do
    echo $n
    n=$(expr $n - 1)
done
