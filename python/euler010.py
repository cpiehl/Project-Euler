#!/usr/bin/env python3

# Project Euler #10
# Find the sum of all the primes below two million.
# Answer:	142913828922

marked = [0] * 2000000
value = 3
s = 2
while value < 2000000:
	if marked[value] == 0:
		s += value
		i = value
		while i < 2000000:
			marked[i] = 1
			i += value
	value += 2
print(s)