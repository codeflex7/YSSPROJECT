#!/bin/bash
rows=4

for((i=0;i<rows;i++));do
for((s=1;s<rows-i;s++));do
echo -n " "

done

c=1

for((j=0;j<=i;j++));do
echo -n "$c "
c=$((c*(i-j)/(j+1)))

done
echo

done


