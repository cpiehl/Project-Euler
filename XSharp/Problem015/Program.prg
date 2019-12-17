// Project Euler #15
// Starting in the top left corner of a 2x2 grid, and only being able to
//   move to the right and down, there are exactly 6 rotues to the bottom
//   right corner.
// How many such routes are there through a 20x20 grid?
// Answer:    137846528820
//
// Note: 40!/(20!)(20!) is boring!
// Manually math out Pascal's triangle instead

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem015

	GLOBAL CONST SIZE := 20 AS INT
	GLOBAL CONST MAX := (2 * SIZE) + 1 AS INT
	
	FUNCTION Start() AS VOID STRICT
		LOCAL matrix := List<List<INT64>>{} AS List<List<INT64>>
		LOCAL i, j AS INT
		
		// initialize all zeroes
		FOR i := 0 UPTO MAX - 1
			matrix:Add(List<INT64>{})
			matrix[i]:AddRange(Enumerable.Repeat((INT64)0, MAX))
		NEXT
		
		// set first row and first column to 1
		FOR i := 0 UPTO MAX - 1
			matrix[i][0] := (INT64)1
			matrix[0][i] := (INT64)1
		NEXT
		
		// compute pascal's triangle
		FOR i := 1 UPTO MAX - 1
			FOR j := 1 UPTO MAX - 1
				matrix[j][i] = matrix[j - 1][i] + matrix[j][i - 1]
			NEXT
		NEXT
		
		Console.WriteLine("Answer: " + matrix[SIZE][SIZE]:ToString())
		Console.WriteLine("Press any key to continue...")
		Console.ReadKey()
		
END NAMESPACE
