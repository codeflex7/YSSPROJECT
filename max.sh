
#!/bin/bash

read -p "Enter 3 number with space:"  a b c

max=$a


(($b>max)) && max=$b
(($c>max)) && max=$c

echo "Maximum of $a $b $c is $max "

