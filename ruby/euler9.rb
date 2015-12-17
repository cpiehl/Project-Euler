#!/usr/bin/ruby
# Project Euler #9
# A Pythagorean triplet is a set of three natural numbers,
#   a < b < c, for which,
#   a^2 + b^2 = c^2
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
# Answer: 31875000

1.upto(1000) do |a|
	a.upto(1000 - a) do |b|
		c = 1000 - (a + b)
		if (a*a + b*b) == (c*c)
			puts(a * b * c)
		end
	end
end


