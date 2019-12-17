// Project Euler Problem #001
// Find the sum of all the multiples of 3 or 5 below 1000.
// Answer: 233168

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem001

    FUNCTION Start() AS VOID STRICT
        LOCAL i AS INT, total AS INT
        FOR i := 1 UPTO 999
            IF i % 3 == 0 .OR. i % 5 == 0
                total := total + i
            ENDIF
        NEXT
        
        Console.WriteLine("Sum: " + total:ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
	
END NAMESPACE
