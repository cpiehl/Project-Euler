// Euler001.prg
// Find the sum of all the multiples of 3 or 5 below 1000.
// Answer: 233168

CLASS Euler001

	STATIC METHOD Run() AS INT
		LOCAL i, sum := 0 AS INT

		FOR i := 1 TO 999
			IF i % 3 == 0 || i % 5 == 0
				sum += i
			ENDIF
		NEXT
		RETURN sum

END CLASS
