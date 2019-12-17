// Project Euler Problem #009
// There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.
// Answer: 31875000

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem009

    FUNCTION Start() AS VOID STRICT
        Console.WriteLine("Answer: " + PythagoreanTripletProduct(1000):ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
        
    FUNCTION PythagoreanTripletProduct(n AS INT) AS INT
		LOCAL a, b, c AS INT

		FOR a := 1 UPTO (n - 2)
			FOR b := 1 UPTO (n - 1) - a
				c := n - (a + b)
				IF (a * a) + (b * b) == (c * c)
					RETURN a * b * c
				ENDIF
			NEXT
		NEXT
		RETURN -1
	
END NAMESPACE
