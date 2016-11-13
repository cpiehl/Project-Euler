#!/usr/bin/env python3
# If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.

# Not all numbers produce palindromes so quickly. For example,

# 349 + 943 = 1292,
# 1292 + 2921 = 4213
# 4213 + 3124 = 7337

# That is, 349 took three iterations to arrive at a palindrome.
# We shall assume that a number is Lychrel until proven otherwise.
# You are given that for every number below ten-thousand, it will become a
#   palindrome in less than fifty iterations or it is a Lychrel number

# How many Lychrel numbers are there below ten-thousand?

# Answer: 249

def reverse(n):
	return int(str(n)[::-1])


def isPalindrome(n):
	return n == reverse(n)


lychrel_count = 10000 # Assume all are Lychrel until proven otherwise
for n in range(10000):
#~ for n in [10677]:
#~ for n in [349]:
#~ for n in [196]:
	iter_count = 0
	while iter_count < 50:
		n += reverse(n)
		if isPalindrome(n):
			#~ print(n, iter_count)
			lychrel_count -= 1
			break
		iter_count += 1

print(lychrel_count)
