// Project Euler Problem #016
// 2^15 = 32768 and the sum of its digits is 3+2+7+6+8 = 26
// What is the sum of the digits of the number 2^1000?
// Answer:    1366

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text

BEGIN NAMESPACE Problem016

	FUNCTION Start() AS VOID STRICT
		LOCAL s := "1" AS STRING
		LOCAL i AS INT
		FOR i := 1 UPTO 1000
			s = StringIntDoubler(s)
		NEXT
		
		LOCAL digitSum := s:Select({|c| Int32.Parse(c:ToString())}):Sum() AS INT
		
        Console.WriteLine("Answer: " + digitSum:ToString())
        Console.WriteLine("Press any key to continue...")
        Console.ReadKey()
		
	FUNCTION StringIntDoubler(s AS STRING) AS STRING
		LOCAL carry := 0 AS INT
		LOCAL result := String.Empty AS STRING
		
		// Start from LSD, work backwards
		LOCAL i AS INT
		FOR i := s:Length - 1 DOWNTO 0
			LOCAL resultDigit := (Int32.Parse(s[i]:ToString()) * 2) + carry AS INT
			IF resultDigit >= 10
				resultDigit %= 10
				carry := 1
			ELSE
				carry := 0
			ENDIF
			result = i"{resultDigit}{result}"
		NEXT
		
		IF carry > 0
			result = "1" + result
		ENDIF
			
		RETURN result
		
END NAMESPACE
