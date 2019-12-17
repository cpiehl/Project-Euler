// Project Euler Problem #006
// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
// Answer: 25164150

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem006

	FUNCTION Start() AS VOID STRICT
        LOCAL sumofsquare := 0, squareofsum := 0 AS INT
		LOCAL i AS INT

		FOR i := 1 UPTO 100
			sumofsquare += (i * i)
			squareofsum += i
		NEXT

		squareofsum *= squareofsum

        Console.WriteLine("Answer: " + (squareofsum - sumofsquare):ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
	
END NAMESPACE
