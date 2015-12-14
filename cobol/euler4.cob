*> Find the largest palindrome made from the product of two 3-digit numbers.
*> compile with cobc -free -O -x -o euler4.exe euler4.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER4.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-RESULT PIC 9(6) VALUE 0.
	01 WS-NUM PIC 9(6) VALUE 0.
	01 WS-REV PIC 9(6) VALUE 0.
	01 WS-MOD PIC 9(4) VALUE 0.
	01 WS-X PIC 9(4) VALUE 0.
	01 WS-Y PIC 9(4) VALUE 0.
	01 WS-NULL PIC 9 VALUE 0.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM X-PARA VARYING WS-X FROM 100 BY 1 UNTIL WS-X=1000.
	DISPLAY WS-RESULT.
	STOP RUN.

*> Reverse the number
	R-PARA.
	DIVIDE 10 INTO WS-NUM GIVING WS-NUM REMAINDER WS-MOD;
	COMPUTE WS-REV = WS-REV * 10 + WS-MOD.

	X-PARA.
	PERFORM Y-PARA VARYING WS-Y FROM 100 BY 1 UNTIL WS-Y=1000.

*> Check products for palindromes
	Y-PARA.
	COMPUTE WS-NUM = WS-X * WS-Y.
	MOVE 0 TO WS-REV.
	PERFORM R-PARA UNTIL WS-NUM < 1.
	COMPUTE WS-NUM = WS-X * WS-Y.
	IF WS-NUM = WS-REV AND WS-NUM > WS-RESULT THEN
		MOVE WS-NUM TO WS-RESULT
	END-IF.


