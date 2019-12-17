// Project Euler Problem #014
// Collatz iterative sequence defined as:
//   n -> n/2 if n is even
//   n -> 3n + 1 if n is odd
//
// Which starting number, under one million, produces the longest chain?
// Answer:   	837799

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem014

    FUNCTION Start() AS VOID STRICT
        LOCAL collatzLengths := Dictionary<DWORD, DWORD>{} AS Dictionary<DWORD, DWORD>
        LOCAL n, length, maxlen = 0, n_maxlen = 0 AS DWORD
        
        FOR n := 2 UPTO 1000000
            length := 1
            LOCAL x := n AS DWORD
            WHILE x != 1
                IF collatzLengths:ContainsKey(x) && collatzLengths[x] != 0
                    length += collatzLengths[x] - 1
                    EXIT
                ELSE
                    IF x % 2 == 0
                        x /= 2
                    ELSE
                        x := (3 * x) + 1
                    ENDIF
                    length++
                ENDIF
            END
            IF FALSE == collatzLengths:ContainsKey(n)
                collatzLengths:Add(n, 0)
            ENDIF
            
            collatzLengths[n] := length
            
            IF length > maxlen
                maxlen := length
                n_maxlen := n
            ENDIF
        NEXT
        
        Console.WriteLine(i"Answer: {n_maxlen}")
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
	
END NAMESPACE
