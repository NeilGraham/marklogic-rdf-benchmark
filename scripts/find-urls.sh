#!/bin/bash

# [not-tested]

# Get the script's local directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the parent directory as an absolute path
DIR_PARENT="$(readlink -f "$DIR/..")"

# Set the directory containing .nt files
dir="$DIR_PARENT/output"

# Set the output file for the extracted URLs
output_file="$DIR_PARENT/urls.txt"

# Regex pattern to match URLs within Literals
url_pattern='(http|https|ftp|ftps)://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(/\S*)?'

# Regex pattern to match Literals in the N-Triples format
literal_pattern="\"{[^\"\}]*$url_pattern[^\"\}]*}\""

# Clear the output file before processing
echo -n "" > "$output_file"

# Loop through all .nt files in the directory
for file in "$dir"/*.nt; do
  echo "Processing file: $file"
  
  # Find Literals with URLs, extract the URLs, and append them to the output file
  grep -oE "$literal_pattern" "$file" | grep -oE "$url_pattern" >> "$output_file"
done

echo "URL extraction completed. Check the extracted URLs in $output_file."
