#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# For all files in '$DIR/output/', delete those that are empty
find $DIR/../output -type f -empty -delete