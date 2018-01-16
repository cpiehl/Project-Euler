// Euler002.prg
// By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
// Answer: 4613732

CLASS Euler002

	STATIC METHOD Run() AS INT
		LOCAL n := 1, newn, lastn := 0, sum := 0 AS INT
		WHILE n < 4000000
			newn := n + lastn
			IF newn % 2 == 0
				sum += newn
			ENDIF
			lastn := n
			n := newn
		END
		RETURN sum

END CLASS
