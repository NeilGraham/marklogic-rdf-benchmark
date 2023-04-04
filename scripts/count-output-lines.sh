#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

find $DIR/../output -type f -exec cat {} \; | wc -l | awk '{print $1}'
