// Project Euler Problem #004
// Find the largest palindrome made from the product of two 3-digit numbers.
// Answer: 906609

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem004

    FUNCTION Start() AS VOID STRICT
        LOCAL p, x, y, result := -1 AS INT

		FOR x := 100 UPTO 999
			FOR y := 100 UPTO 999
				p := x * y
				IF p == Reverse(p) && p > result
					result := p
				ENDIF
			NEXT
        NEXT
        
        Console.WriteLine("Answer: " + result:ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
        
    FUNCTION Reverse(n AS INT) AS INT
		LOCAL left := n AS INT
		LOCAL rev := 0 AS INT
		LOCAL r AS INT

		WHILE left > 0
			r := left % 10
			rev := rev * 10 + r
			left := left / 10
		END
		RETURN rev
	
END NAMESPACE
