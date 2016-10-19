#!/usr/bin/python3
# Project Euler #13
# Output the first 10 digits of the sum of the 100 50-digit numbers
#   in input13.txt
# Answer:   	5537376230

with open("input13.txt", 'r') as f:
	sum = 0
	for line in f:
		sum += int(line)

	print(str(sum)[:10])