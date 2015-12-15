#!/bin/bash
# Project Euler #6
# Find the difference between the sum of the squares of the first one
#   hundred natural numbers and the square of the sum.
# Answer: 25164150

squareofsums=0
sumofsquares=0
i=1
while [ $i -lt 101 ]
do
	let "squareofsums += i"
	let "sumofsquares += i*i"
	let "i += 1"
done
let "squareofsums *= squareofsums"
echo $(($squareofsums - $sumofsquares))

