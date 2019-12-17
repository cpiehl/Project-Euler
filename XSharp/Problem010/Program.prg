// Project Euler Problem #010
// Find the sum of all the primes below two million.
// Answer: 142913828922

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem010

	FUNCTION Start() AS VOID STRICT
		LOCAL sievedPrimes := PrimeSieve(2000000) AS List<LOGIC>
		LOCAL primes := List<INT64>{} AS List<INT64>
		LOCAL i AS INT
		FOR i := 0 UPTO sievedPrimes:Count - 1
			IF FALSE == sievedPrimes[i]
				primes:Add(i)
			ENDIF
		NEXT
		LOCAL s := primes:Sum() AS INT64
		
		
		Console.WriteLine("Answer: " + s:ToString())
		Console.WriteLine("Press any key to continue...")
		Console.ReadKey()
		
	FUNCTION PrimeSieve(limit AS INT) AS List<LOGIC>
		LOCAL i, j, z := (INT)(Math.Sqrt(limit) + 0.5) AS INT
		LOCAL marked := List<LOGIC>{} AS List<LOGIC>
		marked:AddRange(Enumerable.Repeat(FALSE, limit))
		
		marked[0] := TRUE
		marked[1] := TRUE
		FOR i := 4 UPTO marked:Count - 1 STEP 2
			marked[i] := TRUE
		NEXT
		
		LOCAL p := 3 AS INT
		WHILE p < limit
			IF !marked[p]
				FOR i := p + p UPTO limit - 1 STEP p
					marked[i] := TRUE
				NEXT
			ENDIF
			p += 2
		ENDDO
		
		RETURN marked
		
END NAMESPACE
