#!/bin/bash

read -p "Enter a number:" n

sum=0

for((i=1;i<n;i++)); do
if((n%i==0)); then
sum=$((sum+i));
fi

done

if ((n>0 && n==sum)); then
echo "$n is a Perfect Number "

else
echo "$n is a not Perfect Number "

fi
