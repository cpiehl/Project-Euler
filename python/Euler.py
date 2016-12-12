#!/usr/bin/env python3
import itertools
import random
import time
from bisect import bisect_left
from math import sqrt, ceil, floor

def timing(f):
	def wrap(*args):
		time1 = time.time()
		ret = f(*args)
		time2 = time.time()
		print('%s function took %0.3f ms' % (f.__name__, (time2-time1)*1000.0))
		return ret
	return wrap

def memoize(f):
	"""Returns a memoized version of f"""
	memory = {}
	def memoized(*args):
		if args not in memory:
			memory[args] = f(*args)
		return memory[args]
	return memoized

def is_permutation(a,b): return sorted(str(a))==sorted(str(b))

def is_palindromic(n): n=str(n); return n==n[::-1]

def is_pandigital(n, s=9): n=str(n); return len(n)==s and not '1234567890'[:s].strip(n)


def prime_factors(n):
	f = []
	i = 2
	while n % i == 0:
		f.append(i)
		n //= i
	i = 3
	while n % i == 0:
		f.append(i)
		n //= i
	i = 5               # 6n - 1
	while i * i <= n:
		while n % i == 0:
			f.append(i)
			n //= i
		i += 2            # 6n + 1
		while n % i == 0:
			f.append(i)
			n //= i
		i += 4
	if n > 1:
		f.append(int(n))
	return f


factorial_memory = {0: 1, 1: 1, 'max': 1}
def factorial(num):
	"""Memoized for speeeeeed"""
	assert num >= 0

	if num <= factorial_memory['max']:
		return factorial_memory[num]

	for x in range(factorial_memory['max']+1, num+1):
		factorial_memory[x] = factorial_memory[x-1] * x
	factorial_memory['max'] = num
	return factorial_memory[num]


fibonacci_memory = {0: 0, 1: 1, 'max': 1}
def fibonacci(num):
	"""Memoized for speeeeeed"""
	assert num >= 0
	if num <= fibonacci_memory['max']:
		return fibonacci_memory[num]

	for x in range(fibonacci_memory['max']+1, num+1):
		fibonacci_memory[x] = fibonacci_memory[x-1] + fibonacci_memory[x-2]
	fibonacci_memory['max'] = num
	return fibonacci_memory[num]


def gcd(a, b):
	if a < 0:  a = -a
	if b < 0:  b = -b
	if a == 0: return b
	while (b): a, b = b, a%b
	return a


def binary_search(a, x, lo=0, hi=None):
	""" Returns index of x, or -1 if not found """
	hi = hi if hi is not None else len(a)
	pos = bisect_left(a, x, lo, hi)
	return (pos if pos != hi and x == a[pos] else -1)


def is_prime(n):
	if n <= 1: return False
	if n <= 3: return True
	if n%2==0 or n%3 == 0: return False
	r = int(sqrt(n))
	f = 5
	while f <= r:
		if n%f == 0 or n%(f+2) == 0: return False
		f+= 6
	return True


def perm(n, s):
	"""
	requires function factorial()
	Find the nth permutation of the string s. Example:

	>>>perm(30, 'abcde')
	bcade
	"""
	if len(s)==1: return s
	q, r = divmod(n, factorial(len(s)-1))
	return s[q] + perm(r, s[:q] + s[q+1:])


def binomial(n, k):
	"""
	Calculate C(n,k), the number of ways can k be chosen from n. Example:

	>>>binomial(30,12)
	86493225
	"""
	nt = 1
	for t in range(min(k, n-k)):
		nt = nt * (n-t) // (t+1)
	return nt


def prime_sieve(n):
	"""
	Return a list of prime numbers from 2 to a prime < n. Very fast (n<10,000,000) in 0.4 sec.

	Example:
	>>>prime_sieve(25)
	[2, 3, 5, 7, 11, 13, 17, 19, 23]

	Algorithm & Python source: Robert William Hanks
	http://stackoverflow.com/questions/17773352/python-sieve-prime-numbers
	"""
	sieve = [True] * (n//2)
	for i in range(3,int(n**0.5)+1,2):
		if sieve[i//2]:
			sieve[i*i//2::i] = [False] * ((n-i*i-1)//(2*i)+1)
	return [2] + [i for i in range(1,n,2) if sieve[i]]


def digits_of(n):
	"""Digits of n."""
	d = []
	while n:
		d.append(n % 10)
		n //= 10
	return d[::-1]


def sum_digits(n):
	"""
	Returns the sum of each digit in n.
	"""
	s = 0
	while n:
		s += n % 10
		n //= 10
	return s
	#~ return sum(digits_of(n))


def sum_squared_digits(n):
	"""
	Returns the sum of the squares of each digit in n.
	"""
	s = 0
	while n:
		m = n % 10
		s += m * m
		n //= 10
	return s
	#~ return sum((n * x for n in digits_of(n)))

def number_to_name(num):
	names = {
		1: " one",
		2: " two",
		3: " three",
		4: " four",
		5: " five",
		6: " six",
		7: " seven",
		8: " eight",
		9: " nine",
		10: " ten",
		11: " eleven",
		12: " twelve",
		13: " thirteen",
		14: " fourteen",
		15: " fifteen",
		16: " sixteen",
		17: " seventeen",
		18: " eighteen",
		19: " nineteen",
		20: " twenty",
		30: " thirty",
		40: " fourty",
		#~ 42: " the life, the universe, and everything",
		50: " fifty",
		60: " sixty",
		70: " seventy",
		80: " eighty",
		90: " ninety"
	}
	power_groups = {
		1 : " thousand",
		2 : " million",
		3 : " billion",
		4 : " trillion",
		5 : " quadrillion",
		6 : " quintillion",
		7 : " sextillion",
		8 : " septillion",
		9 : " octillion",
		10: " nonillion",
		11: " decillion",
		12: " undecillion",
		13: " duodecillion",
		14: " tredecillion",
		15: " quattuordecillion",
		16: " quindecillion",
	}
	num = str(num)[::-1]
	dec = None
	i = num.find('.')
	if -1 != i:
		dec = num[i-1::-1]  # string of decimals to read off at the end
		num = num[i+1:]
	num = [int(num[i:i+3][::-1]) for i in range(0, len(num), 3)]
	name = ""
	for power_group in range(len(num)-1, -1, -1):
		n = num[power_group] // 100             # hundreds
		if n in names:
			name += names[n] + " hundred"
		n = num[power_group] - (n * 100)  # eg 216 - (2 * 100) = 16
		if n in names:    # if n is special name, eg sixteen
			name += names[n]
		else:
			n = num[power_group] % 100 // 10 * 10  # tens
			if n in names:
				name += names[n]
			n = num[power_group] % 10              # ones
			if n in names:
				name += names[n]
		if power_group in power_groups:
			name += power_groups[power_group]
		elif power_group > 16:
			raise OverflowError("Currently only supports up to 10^51-1.")

	if dec is not None:
		name += " point"
		for d in dec:
			name += names[int(d)]

	return name[1:]
