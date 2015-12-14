#!/usr/bin/ruby
# Find the largest palindrome made from the product of two 3-digit numbers.

def reverse(n) r = 0; r, n = (r*10 + n % 10), n / 10 while n != 0; r end

result = -1
for x in (100..999).reverse_each
	for y in (100..999).reverse_each
		number = x * y
		if number == reverse(number) && number > result then
			result = number
			break
		end
	end
end

puts(result)
