#!/usr/bin/ruby
# What is the largest prime factor of the number 600851475143 ?

number = 600851475143
divisor = 2
while number > 1 do
	if number % divisor == 0 then
		number /= divisor
		divisor -= 1
	end
	divisor += 1
end

puts(divisor)
