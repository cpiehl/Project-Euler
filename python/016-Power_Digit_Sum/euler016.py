#!/usr/bin/env python3
# Project Euler #16
# 2^15 = 32768 and the sum of its digits is 3+2+7+6+8 = 26
# What is the sum of the digits of the number 2^1000?
# Answer:    1366

print(sum([int(x) for x in str(2**1000)]));