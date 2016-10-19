#!/usr/bin/env python3
# Project Euler #6
# Find the difference between the sum of the squares of the first one
#   hundred natural numbers and the square of the sum.
# Answer: 25164150

squareofsums = 0
sumofsquares = 0
for i in range(1, 101):
	squareofsums += i
	sumofsquares += i*i

squareofsums *= squareofsums

print(squareofsums - sumofsquares)
