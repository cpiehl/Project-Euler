#!/usr/bin/env python3
# Consider quadratic Diophantine equations of the form:
#   x^2 - D * y^2 = 1
# For example, when D=13, the minimal solution in x is 649^2 – 13×180^2 = 1.
# It can be assumed that there are no solutions in positive integers when D
#   is square.
# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain
#   the following:
# 3^2 – 2×2^2 = 1
# 2^2 – 3×1^2 = 1
# 9^2 – 5×4^2 = 1
# 5^2 – 6×2^2 = 1
# 8^2 – 7×3^2 = 1
# Hence, by considering minimal solutions in x for D ≤ 7, the largest
#   x is obtained when D=5.
# Find the value of D ≤ 1000 in minimal solutions of x for which the
#   largest value of x is obtained.
# Answer: 661

from math import sqrt

def prime_sieve(limit):
	""" Returns  a list of primes < n """
	sieve = [True] * (limit//2)
	for i in range(3,int(limit**0.5)+1,2):
		if sieve[i//2]:
			sieve[i*i//2::i] = [False] * ((limit-i*i-1)//(2*i)+1)
	return [2] + [2*i+1 for i in range(1,limit//2) if sieve[i]]


# x^2 - D * y^2 = 1 is a Pell equation
def pell(d):
	p, k, x1, y, sd = 1, 1, 1, 0, sqrt(d)

	while k != 1 or y == 0:
		p = k * (p//k+1) - p
		p = p - int((p - sd)//k) * k

		x = (p*x1 + d*y) // abs(k)
		y = (p*y + x1) // abs(k)
		k = (p*p - d) // k
		x1 = x
	return x

L = 1000
print(max((pell(d),d) for d in prime_sieve(L)))
