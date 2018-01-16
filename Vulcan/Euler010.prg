// Euler010.prg
// Find the sum of all the primes below two million.
// Answer: 142913828922

CLASS Euler010

	STATIC METHOD Run() AS INT64
		LOCAL i, j, limit := 2000000, z := CEIL(SQRT(limit)) AS INT
		LOCAL marked := ArrayCreate((DWORD)limit) AS ARRAY

		// init all to true
		FOR i := 1 UPTO ALen(marked)
			marked[i] := FALSE
		NEXT

		LOCAL value := 3 AS INT
		LOCAL s := 2 AS INT64
		WHILE value < limit
			IF !marked[value]
				s += value
				FOR i := value UPTO limit STEP value
					marked[i] := TRUE
				NEXT
			ENDIF
			value += 2
		ENDDO

		RETURN s

END CLASS
