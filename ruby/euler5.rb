#!/usr/bin/ruby
# Project Euler #5
# 2520 is the smallest number that can be divided by each of the numbers
#   from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all
#   of the numbers from 1 to 20?
# Answer: 232792560

puts((11..20).reduce(:lcm))
