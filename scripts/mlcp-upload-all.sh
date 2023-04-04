#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

MAX_WORKERS=14

# For all files in '$DIR/output/', run the script 'mlcp-upload.sh'
parallel -j $MAX_WORKERS $DIR/mlcp-upload.sh :::: <(find $DIR/../output -type f)

# Print time it took to run this script
echo "Time elapsed: $SECONDS seconds"