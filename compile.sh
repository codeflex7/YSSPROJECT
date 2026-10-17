#!/bin/bash

for f in *.c; do
[ -e "$f" ] || { echo "No C files Found"; exit 0; }

if gcc "$f" -o "${f%.c}.out"  2>/dev/null; then
echo "OK $f Compliled" 

else
echo "$f has error deleting it"

rm -f "$f"

fi
done
