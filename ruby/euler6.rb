#!/usr/bin/ruby
# Project Euler #5
# 2520 is the smallest number that can be divided by each of the numbers
#   from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all
#   of the numbers from 1 to 20?
# Answer: 232792560

squareofsums, sumofsquares = 0, 0

1.upto(100) { |x| squareofsums+=x; sumofsquares+=(x*x) }
squareofsums *= squareofsums

puts(squareofsums - sumofsquares)
