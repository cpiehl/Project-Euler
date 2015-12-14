#!/usr/bin/env python3

result = -1
for x in range(999,100,-1):
	for y in range(999,100,-1):
		number = x * y
		if str(number) == str(number)[::-1] and number > result:
			result = number
			break

print(result)
