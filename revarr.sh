#!/bin/bash

arr=(10 20 30 40 50)

rev_arr=()

for((i=${#arr[@]}-1;i>=0;i--));do
rev_arr+=("${arr[$i]}")

done

echo "Reveresed Array: ${rev_arr[@]}"
