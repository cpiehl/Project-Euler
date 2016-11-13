#!/usr/bin/env python3
# How many, not necessarily distinct, values of
# n Choose r, for 1 = n = 100, are greater than one-million?
# Answer: 4075
import operator as op

def ncr(n, r):
	r = min(r, n-r)
	if r == 0: return 1
	numer = 1
	for n in range(n, n-r, -1):
		numer *= n
	denom = 1
	for n in range(1, r+1):
		denom *= n
	return numer//denom

count = 0
for n in range(1,101):
	for r in range(1,n+1):
		if ncr(n, r) > 1000000:
			count += 1
print(count)

#~ print(ncr(5,3))
#~ print(ncr(23,10))
