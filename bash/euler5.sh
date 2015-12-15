#!/bin/bash
# Project Euler #5
# 2520 is the smallest number that can be divided by each of the numbers
#   from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all
#   of the numbers from 1 to 20?
# Answer: 232792560

function lcm() {
	m=$1
	n=$2
	gcd=$(gcd $m $n)
	echo $(($m * $n / $gcd))
}

function gcd() {
	a=$1
	b=$2
	if [ $b -eq 0 ]
	then
		echo "$a"
		return
	fi
	if [ $b -gt $a ]
	then
		gcd $b $a
	else
		let "a = a % b"
		gcd $b $a
	fi
}

result=2
i=11
while [ $i -lt 21 ]
do
	result=$(lcm $result $i)
	let "i+=1"
done
echo $result
