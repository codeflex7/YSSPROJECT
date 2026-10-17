#!/bin/bash

read -p "Enter file name:" file
if [ ! -f "$file" ]; then
echo "File not found $file"
exit 1
fi

sed -i '/^[[:space:]]*$/d' "$file"

echo "Removing Empty lines from $file"

cat "$file"
