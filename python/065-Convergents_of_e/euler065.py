#!/usr/bin/env python3
# e can be written as an infinite continued fraction with values:
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...]

# The first ten terms in the sequence of convergents for e are:

# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.

# Find the sum of digits in the numerator of the 100th convergent of the
#   continued fraction for e.

# Answer: 272
import math

limit = 100

# Build sequence for e
seq = [1] * limit
seq[2::3] = [2*n for n in range(1,limit//3+1)]

conv_numers = [2, 3] # list of numerators
for i in range(2,len(seq)):
	n = seq[i] * conv_numers[i-1] + conv_numers[i-2]
	conv_numers.append(n)

# Sum digits in last numerator
print(sum([int(d) for d in str(conv_numers[-1])]))
