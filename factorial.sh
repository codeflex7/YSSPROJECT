!#/bin/bash
read -p"Enter a number:" n
f=1
for((i=1;i<=n;i++));do
   f==$(f*i);
done
echo "Factorial of $n is $f";
