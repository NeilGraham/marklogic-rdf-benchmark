#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# Max workers can be set with --max-workers argument
MAX_WORKERS=4
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --max-workers)
      MAX_WORKERS="$2"
      shift
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

parallel -j $MAX_WORKERS $DIR/sparql-url.sh :::: $DIR/../urls.txt

# Print time it took to run this script
echo "Time elapsed: $SECONDS seconds"
