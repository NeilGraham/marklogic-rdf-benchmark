#!/bin/bash

# Get script directory
DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

# Get the URL from the argument
url="$1"

output_path=$DIR/../output/$(echo $url | sed 's/[^a-zA-Z0-9]/_/g').nt

# If output file already exists, exit
if [ -f $output_path ]; then
    echo "Output file already exists for $url"
    exit 0
fi

# Execute sparql.anything to create an NT file for the URL
# and store the NT file in the ./output directory
java -jar $DIR/../.installs/sparql-anything-0.8.1.jar --format NT --query <(echo '
PREFIX  xyz:  <http://sparql.xyz/facade-x/data/>
PREFIX  fx:   <http://sparql.xyz/facade-x/ns/>
PREFIX  rdfs: <http://www.w3.org/2000/01/rdf-schema#>
construct {?s ?p ?o} where
{ 
    service <x-sparql-anything:> {
        fx:properties fx:location "'$url'"  ;
        fx:media-type "text/html" .
        ?s ?p ?o  .
    }
}
') > $DIR/../output/$(echo $url | sed 's/[^a-zA-Z0-9]/_/g').nt

# If an error was thrown, append url to list 'urls-with-errors.txt'
if [ $? -ne 0 ]; then
    echo $url >> $DIR/../logs/urls-with-errors.txt
fi