#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# Take input file as first argument
INPUT_FILE="$1"

# Define variables
INPUT_DIRECTORY="$DIR/../output"
ENDPOINT="192.168.50.206"
PORT="8000"
USERNAME="ngraham"
PASSWORD="PILGRIM8sunder.souffle"
DATABASE="App-Services"

# Upload .nt files using MLCP
$DIR/.installs/marklogic-contentpump-11.0.2/bin/mlcp.sh IMPORT \
  -host "$ENDPOINT" \
  -port "$PORT" \
  -username "$USERNAME" \
  -password "$PASSWORD" \
  -mode local \
  -input_file_path $INPUT_FILE \
  -database "$DATABASE" \
  -input_file_type RDF
#   -output_collections "nt_files" \
