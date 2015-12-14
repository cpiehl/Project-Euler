#!/bin/bash
sum=0
i=0
while [  $i -lt 1000 ]; do
	if [ $(($i % 3)) -eq 0 ] || [ $(($i % 5)) -eq 0 ]
	then
		let "sum+=i"
	fi
	let "i+=1"
done
echo $sum