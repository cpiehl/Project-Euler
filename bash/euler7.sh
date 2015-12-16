#!/bin/bash
# Project Euler #7
# What is the 10001st prime number?
# Answer: 104743

i=3
n=1
s=1
x=0
while [ $i -le 10001 ]
do
	if [ $s -eq 1 ]
	then
		let "x = 6 * n - 1"
		s=0
	else
		let "x = 6 * n + 1"
		s=1
		let "n += 1"
	fi
	r=$(echo "sqrt($x)" | bc)
	p=1
	t=3
	while [ $t -le $r ]
	do
		if [ $(($x % $t)) -eq 0 ]
		then
			p=0
		fi
		let "t += 2"
	done
	if [ $p -eq 1 ]
	then
		let "i += 1"
	fi
done
echo $x

