// Euler006.prg
// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
// Answer: 25164150

CLASS Euler006

	STATIC METHOD Run() AS INT
		LOCAL sumofsquare := 0, squareofsum := 0 AS INT
		LOCAL i AS INT

		FOR i := 1 UPTO 100
			sumofsquare += (i * i)
			squareofsum += i
		NEXT

		squareofsum *= squareofsum

		RETURN squareofsum - sumofsquare

END CLASS
