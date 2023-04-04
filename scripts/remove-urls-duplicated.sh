#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# Read file and output unique lines
sort -u $DIR/../urls.txt > tmpfile && mv tmpfile $DIR/../urls.txt

