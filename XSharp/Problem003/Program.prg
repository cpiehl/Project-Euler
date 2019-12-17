// Euler003.prg
// What is the largest prime factor of the number 600851475143 ?
// Answer: 6857

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem003

	FUNCTION Start() AS VOID STRICT
		
        LOCAL number := 600851475143 AS INT64
		LOCAL divisor := 2 AS INT

		WHILE number > 1
			IF number % divisor == 0
				number /= divisor
				divisor -= 1
			ENDIF
			divisor += 1
		END
        
        Console.WriteLine("Largest prime factor: " + divisor:ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
	
END NAMESPACE
