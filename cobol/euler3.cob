*> What is the largest prime factor of the number 600851475143 ?
*> compile with cobc -free -O -x -o euler3.exe euler3.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER3.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-N PIC 9(12) VALUE 600851475143.
	01 WS-DIV PIC 9(4) VALUE 2.
	01 WS-MOD PIC 9(4) VALUE 0.
	01 WS-NULL PIC 9 VALUE 0.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA UNTIL WS-N < 2.
	DISPLAY WS-DIV.
	STOP RUN.

	B-PARA.
	DIVIDE WS-N BY WS-DIV GIVING WS-NULL REMAINDER WS-MOD.
	IF WS-MOD = ZERO THEN
		DIVIDE WS-DIV INTO WS-N
		SUBTRACT 1 FROM WS-DIV
	END-IF.
	ADD 1 TO WS-DIV.
