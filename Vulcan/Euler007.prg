// Euler007.prg
// What is the 10 001st prime number?
// Answer: 104743

CLASS Euler007

	STATIC METHOD Run() AS INT
		LOCAL count := 1, n := 1 AS INT
		WHILE count < 10001
			n += 2
			IF IsPrime(n)
				count++
			ENDIF
		ENDDO
		RETURN n

	PRIVATE STATIC METHOD IsPrime(n AS INT) AS LOGIC
		LOCAL i, z := CEIL(SQRT(n)) AS INT
		IF n % 2 == 0
			RETURN FALSE
		ENDIF
		FOR i := 3 UPTO z STEP 2
			IF n % i == 0
				RETURN FALSE
			ENDIF
		NEXT
		RETURN TRUE

END CLASS
