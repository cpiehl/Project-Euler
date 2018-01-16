// Euler005.prg
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
// Answer: 232792560

CLASS Euler005

	STATIC METHOD Run() AS INT
		LOCAL i, n := 2520 AS INT
		LOCAL found AS LOGIC

		WHILE TRUE
			found := TRUE
			FOR i := 11 UPTO 20
				IF n % i != 0
					found := FALSE
					EXIT
				ENDIF
			NEXT

			IF found
				EXIT
			ENDIF

			n += 2520
		ENDDO

		RETURN n

END CLASS
