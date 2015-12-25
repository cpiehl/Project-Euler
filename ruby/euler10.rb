#!/usr/bin/ruby
# Project Euler #10
# Find the sum of all the primes below two million.
# Answer:	142913828922

require 'prime'

puts( Prime.each(2000000).inject(:+) )
