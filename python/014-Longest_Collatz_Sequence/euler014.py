#!/usr/bin/env python3
# Project Euler #14
# Collatz iterative sequence defined as:
#  n -> n/2 if n is even
#  n -> 3n + 1 if n is odd
#
# Which starting number, under one million, produces the longest chain?
# Answer:   	837799

MAX = 1000000
collatz_lengths = {}
maxlen = 0
n_maxlen = -1
for n in range(2, MAX):
	# Calculate Collatz series length
	length = 1
	x = n
	while x != 1:
		if (x in collatz_lengths): # Already found
			length += collatz_lengths[x] - 1
			break
		else:
			if (x & 1 != 1):
				x = (x >> 1)
			else:
				x += (x << 1) + 1
			length += 1

	collatz_lengths[n] = length

	if length > maxlen:
		maxlen = length
		n_maxlen = n

print("Max: " + str(n_maxlen) + " -> " + str(maxlen))