#!/bin/bash

read -p "Enter Directory Path: " dir
if [ ! -d "$dir" ]; then
echo "$dir Directory not Found"
exit 1
fi
echo "Deleting these files"
ls "$dir"/*.txt 2>/dev/null || { echo "No suvch Dir found"; exit 0; }
rm -f "$dir"/*.txt
echo "DOne...."
