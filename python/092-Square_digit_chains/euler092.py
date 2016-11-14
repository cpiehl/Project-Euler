#!/usr/bin/env python
from Euler import sum_squared_digits, timing
# A number chain is created by continuously adding the square of the digits
#   in a number to form a new number until it has been seen before.

# For example,

# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# Therefore any chain that arrives at 1 or 89 will become stuck in an
#   endless loop. What is most amazing is that EVERY starting number
#   will eventually arrive at 1 or 89.

# How many starting numbers below ten million will arrive at 89?

# Answer: 8581146
# Still takes ~30s to solve, needs a better algorithm

@timing
def main():
	cyclical = {1, 4, 10, 13, 16, 20, 32, 37, 42, 44, 58, 89, 145}
	#~ cyclical = {'1', '4', '01', '13', '16', '02', '23', '37', '24', '44', '58', '89', '145'}
	happy = {44, 32, 13, 10, 1}
	unhappy = {4, 16, 37, 58, 89, 145, 42, 20}

	count = 0
	for i in range(1,10**7):
		j = i
		chain = set() # All numbers in the chain, for if we come across them later
		#~ print(''.join(sorted(str(j))))
		#~ while ''.join(sorted(str(j))) not in cyclical:
		while j not in cyclical:
			#~ print([int(c)**2 for c in str(j)], j)
			#~ j = sum([int(c)**2 for c in str(j)]) # sum squares of digits
			#~ j = sum([int(c)*int(c) for c in str(j)]) # mult is faster than pow
			#~ j = sum((int(c)*int(c) for c in str(j))) # generator is faster
			j = sum_squared_digits(j) # pure ints is even faster

			#~ chain.add(''.join(sorted(str(j))))
			chain.add(j)
		else:
			cyclical |= chain  # 2x faster than cyclical = cyclical | chain
			if j in unhappy:
				unhappy |= chain
				count += 1

	print(count)

if __name__ == "__main__":
	main()
