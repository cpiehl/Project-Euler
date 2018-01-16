// Euler003.prg
// What is the largest prime factor of the number 600851475143 ?
// Answer: 6857

CLASS Euler003

	STATIC METHOD Run() AS INT
		LOCAL number := 600851475143 AS INT64
		LOCAL divisor := 2 AS INT

		WHILE number > 1
			IF number % divisor == 0
				number /= divisor
				divisor -= 1
			ENDIF
			divisor += 1
		END
		RETURN divisor

END CLASS
