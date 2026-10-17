#!/bin/bash

read -p "Enter file name:"  file

if [ ! -f "$file" ]; then
echo "File not Found: $file"
exit 1
fi

echo "Lines $(wc -l < "$file")"
echo "Words $(wc -w < "$file")"

