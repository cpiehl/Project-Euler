#!/bin/bash
sum=0
n=1
lastn=0
newn=0
while [  $n -lt 4000000 ]; do
	let "newn=n+lastn"
	if [ $(($newn % 2)) -eq 0 ]
	then
		let "sum+=newn"
	fi
	let "lastn=n"
	let "n=newn"
done
echo $sum