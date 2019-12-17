// Project Euler Problem #005
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
// Answer: 232792560

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem005

	FUNCTION Start() AS VOID STRICT
		// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
		LOCAL i, n := 2520 AS INT
		LOCAL found AS LOGIC
		
		WHILE TRUE
			found := TRUE
			FOR i := 11 UPTO 20 // So don't calculate 1 to 10...
				IF n % i != 0
					found := FALSE
					EXIT
				ENDIF
			NEXT
			
			IF found
				EXIT
			ENDIF
			
			n += 2520 // ...and add the result of 1 to 10 instead
		ENDDO
		
		Console.WriteLine("Answer: " + n:ToString())
		Console.WriteLine("Press any key to continue...")
		Console.ReadKey()
		
END NAMESPACE
