#!/usr/bin/ruby
# Project Euler #6
# Find the difference between the sum of the squares of the first one
#   hundred natural numbers and the square of the sum.
# Answer: 25164150

squareofsums, sumofsquares = 0, 0

1.upto(100) { |x| squareofsums+=x; sumofsquares+=(x*x) }
squareofsums *= squareofsums

puts(squareofsums - sumofsquares)
