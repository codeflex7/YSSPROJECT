#!/bin/bash

read -p "Enter String:" str

rev_str=" "

for((i=${#str}-1; i>=0; i--));do
rev_str="$rev_str${str:i:1}"
done
echo "Reveresed: $rev_str"
