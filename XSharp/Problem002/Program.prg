// Project Euler Problem #002
// By considering the terms in the Fibonacci sequence whose values 
//   do not exceed four million, find the sum of the even-valued terms.
// Answer: 4613732

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem002

	FUNCTION Start() AS VOID STRICT
        LOCAL fib := Fibonacci(4000000) AS IEnumerable<INT>
        Console.WriteLine("Sum: " + fib:Where({| f | f % 2 == 0}):Sum():ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
        
    FUNCTION Fibonacci(max AS INT) AS IEnumerable<INT>
		LOCAL n := 1, newn, lastn := 0 AS INT
        WHILE n < max
            newn := n + lastn
            YIELD RETURN newn
			lastn := n
			n := newn
        END
	
END NAMESPACE
