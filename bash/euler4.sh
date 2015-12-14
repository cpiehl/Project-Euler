#!/bin/bash
# Find the largest palindrome made from the product of two 3-digit numbers.
# Super slow compared to other languages
result=-1
num=0
rev=0
x=100
while [ $x -lt 1000 ]
do
	y=100
	while [ $y -lt 1000 ]
	do
		num=$(($x * $y))
		rev=0
		while [ $num -gt 0 ]
		do
			rem=$(( $num % 10 ))
			rev=$(( $rev * 10 + $rem ))
			num=$(( $num / 10 ))
		done
		num=$(($x * $y))
		if [ $num -eq $rev ] && [ $num -gt $result ]
		then
			let "result=num"
			break
		fi
		let "y+=1"
	done
	let "x+=1"
done
echo $result