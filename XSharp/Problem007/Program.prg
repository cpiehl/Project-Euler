// Project Euler Problem #007
// What is the 10 001st prime number?
// Answer: 104743

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem007

	FUNCTION Start() AS VOID STRICT
		LOCAL primes := GetNPrimes(10000) AS IEnumerable<INT>
        
        Console.WriteLine("Answer: " + primes:Last():ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
        
    FUNCTION GetNPrimes(n AS INT) AS IEnumerable<INT>
		LOCAL count := 1, p := 1 AS INT
		WHILE count <= n
			p += 2
			IF IsPrime(p)
                count++
				YIELD RETURN p
			ENDIF
        ENDDO
        
    FUNCTION IsPrime(n AS INT) AS LOGIC
		LOCAL i, z := (INT)(Math.Sqrt(n) + 0.5) AS INT
		IF n % 2 == 0
			RETURN FALSE
		ENDIF
		FOR i := 3 UPTO z STEP 2
			IF n % i == 0
				RETURN FALSE
			ENDIF
		NEXT
		RETURN TRUE
	
END NAMESPACE
