#!/usr/bin/env python3

number = 600851475143
divisor = 2
while number > 1:
	if number % divisor == 0:
		number /= divisor
		divisor -= 1
	divisor += 1

print(divisor)