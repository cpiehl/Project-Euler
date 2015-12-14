#!/bin/bash
number=600851475143
divisor=2
while [  $number -gt 1 ]; do
	if [ $(($number % $divisor)) -eq 0 ]
	then
		let "number/=divisor"
		let "divisor-=1"
	fi
	let "divisor+=1"
done
echo $divisor