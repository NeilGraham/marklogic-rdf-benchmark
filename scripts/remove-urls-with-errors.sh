#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# For all lines in 'urls-with-errors.txt', remove lines in 'urls.txt' that match
while read line; do
    sed -i "\#$line#d" $DIR/../urls.txt
done < $DIR/../logs/urls-with-errors.txt