#!/usr/bin/env python3

result = -1
for x in range(100,1000):
	for y in range(100,1000):
		number = x * y
		if str(number) == str(number)[::-1] and number > result:
			result = number
			break

print(result)
