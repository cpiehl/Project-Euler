#!/usr/bin/env python3
# Find the last 10 digits of the non-Mersenne prime
#   28433 * 2 ^ 7830457 + 1
# Answer: 8739992577

print((28433 * pow(2, 7830457) + 1) % (10**10))
