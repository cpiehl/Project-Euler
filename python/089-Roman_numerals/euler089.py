#!/usr/bin/env python3
# The 11K text file, roman.txt, contains one thousand numbers written in
#   valid, but not necessarily minimal, Roman numerals.
# Note: You can assume that all the Roman numerals in the file contain no
#   more than four consecutive identical units. (Hint! String replacement)
# Find the number of characters saved by writing each of these in their
#   minimal form.
# Answer: 743
import re

with open("roman.txt") as f:
	rows = f.read()
	# All of these get shortened to 2 characters.  For counting purposes it
	#   doesn't matter which character
	print(len(rows) - len(re.sub("CCCC|DCCCC|XXXX|LXXXX|IIII|VIIII", 'nn', rows)))
