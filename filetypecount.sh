#!/bin/bash
# Description: Count the number of files with a specific extension in the current directory.
ext=$1
dir=$2

wild_card_path="$dir/*.$ext"
COUNT=0;

for file in $wild_card_path; do
    if [ -f "$file" ]; then
        COUNT=$((COUNT+1))
    fi
done

echo "Total number of files with extension are .$ext in $dir:$COUNT"