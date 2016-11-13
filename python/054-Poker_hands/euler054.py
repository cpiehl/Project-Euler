#!/usr/bin/env python3
# The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

# How many hands does Player 1 win?

ONEPAIR = 1
TWOPAIR = 2
THREEOFAKIND = 3
STRAIGHT = 4
FLUSH = 5
FULLHOUSE = 6
FOUROFAKIND = 7
STRAIGHTFLUSH = 8
ROYALFLUSH = 9

def faceToValue(face):
	if face == 'T':
		value = 10
	elif face == 'J':
		value = 11
	elif face == 'Q':
		value = 12
	elif face == 'K':
		value = 13
	elif face == 'A':
		value = 14
	else:
		value = int(face)
	return value


def unique(a):
	seen = []
	return not any([i in seen or seen.append(i) for i in a])

def handRank(hand):
	hand = [{'value':faceToValue(card[0]),'suit':card[1]} for card in hand]
	#~ print(hand)
	rank = 0
	highestInRank = 0
	if all(map(lambda card: card['suit'] == hand[0]['suit'], hand)):
		rank = FLUSH
		highestInRank = max([card['value'] for card in hand])
		if highestInRank - min([card['value'] for card in hand]) == 4:
			rank = STRAIGHTFLUSH
			if highestInRank == 14: # straight flush with ace at the top
				rank = ROYALFLUSH
	elif unique([card['value'] for card in hand]):
		highestInRank = max([card['value'] for card in hand])
		if highestInRank - min([card['value'] for card in hand]) == 4:
			rank = STRAIGHT
	else:
		counts = [0] * 15
		for card in hand:
			counts[card['value']] += 1
		if 4 in counts:
			rank = FOUROFAKIND
			highestInRank = counts.index(4)
		elif 3 in counts:
			rank = THREEOFAKIND
			highestInRank = counts.index(3)
			if 2 in counts:
				rank = FULLHOUSE
		elif 2 in counts:
			rank = ONEPAIR
			highestInRank = counts.index(2)
			if counts.count(2) == 2:
				rank = TWOPAIR
				highestInRank = max([value for value,count in enumerate(counts) if count == 2])
	#~ print([value for value in counts])

	return rank, highestInRank, max([card['value'] for card in hand]) # highest card

hands = []
with open("p054_poker.txt") as f:
	player1Wins = 0
	for line in f:
		hand1 = line[:14].split(" ")
		hand2 =	line[15:-1].split(" ")

		rank1, highestInRank1, highestCard1 = handRank(hand1)
		rank2, highestInRank2, highestCard2 = handRank(hand2)

		#~ print(hand1, rank1, highestInRank1, highestCard1)
		#~ print(hand2, rank2, highestInRank2, highestCard2)

		if rank1 > rank2 or \
			(rank1 == rank2 and (highestInRank1 > highestInRank2 or \
			(highestInRank1 == highestInRank2 and highestCard1 > highestCard2))):
			player1Wins += 1
		#~ break
	print(player1Wins)
