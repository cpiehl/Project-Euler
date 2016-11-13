#!/usr/bin/env python3
# The encryption key consists of three lower case characters.
# Using cipher.txt, a file containing the encrypted ASCII codes, and the
#   knowledge that the plain text must contain common English words, decrypt
#   the message and find the sum of the ASCII values in the original text.
# Answer:

# 10 most common English words 2 or more characters
common_words = [
	"the",
	"be",
	"to",
	"of",
	"and",
	"in",
	"that",
	"have",
	"it",
	"for"
]

with open("cipher.txt") as f:
	cipher = f.readlines()[0].split(',')
	cipherLength = len(cipher)

	ptWordCounts = {} # plaintext common word counts per key

	# Build the key
	for a in range(97,123):  # loop a-z
		for b in range(97,123):
		#~ for b in range(97,98):
			for c in range(97,123):
			#~ for c in range(97,98):
				# FIGURE OUT WHY IT'S THIS ORDER - because it trims from the end?
				# but it doesn't really matter as long as we try every permutation
				key = ([c, a, b] * (cipherLength // 3 + 1))[:cipherLength]

				# cipher XOR key
				plaintext = ""
				for i in range(cipherLength):
					plaintext += chr(int(cipher[i]) ^ key[i])
				#~ print(plaintext)

				# Count number of common words to sort for easier key selection
				count = 0
				for word in common_words:
					if word in plaintext:
						count += 1
				if count > 0:
					ptWordCounts[chr(a) + chr(b) + chr(c)] = count

	count = 0
	for w in sorted(ptWordCounts, key=ptWordCounts.get, reverse=True):

		a = ord(w[0])
		b = ord(w[1])
		c = ord(w[2])
		key = ([c, a, b] * (cipherLength // 3 + 1))[:cipherLength]

		# cipher XOR key
		plaintext = ""
		sum = 0
		for i in range(cipherLength):
			j = int(cipher[i]) ^ key[i]
			plaintext += chr(j)
			sum += j
		#~ print(w, ptWordCounts[w], "Sum:", sum)
		print("Key: %s Count: %d ASCII Sum: %d" % (
			w,
			ptWordCounts[w],
			sum
		))
		print(plaintext)
		count += 1
		if count > 10:
			break
