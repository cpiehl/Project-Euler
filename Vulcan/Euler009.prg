// Euler009.prg
// There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.
// Answer: 31875000

CLASS Euler009

	STATIC METHOD Run() AS INT
		LOCAL a, b, c AS INT

		FOR a := 1 UPTO 998
			FOR b := 1 UPTO 999 - a
				c := 1000 - (a + b)
				IF (a * a) + (b * b) == (c * c)
					RETURN a * b * c
				ENDIF
			NEXT
		NEXT
		RETURN -1

END CLASS
