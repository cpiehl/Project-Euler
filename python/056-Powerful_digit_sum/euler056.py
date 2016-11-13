#!/usr/bin/env python3
# Considering natural numbers of the form, a^b, where a, b < 100,
#   what is the maximum digital sum? eg. 10000 = 1 + 0 + 0 + 0 + 0 = 1
# Answer: 972

def digitSum(n):
	sum = 0
	n = str(n)
	for d in n:
		sum += int(d)
	return sum

maxSum = 0
for a in range(100):
	for b in range(100):
		sum = digitSum(a**b)
		if sum > maxSum:
			maxSum = sum

print(maxSum)
