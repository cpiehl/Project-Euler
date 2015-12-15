*> Project Euler #6
*> Find the difference between the sum of the squares of the first one
*>   hundred natural numbers and the square of the sum.
*> compile with cobc -free -O -x -o euler6.exe euler6.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER6.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-SQUAREOFSUMS PIC 9(8) VALUE 0.
	01 WS-SUMOFSQUARES PIC 9(8) VALUE 0.
	01 WS-RESULT PIC 9(8) VALUE 0.
	01 WS-I PIC 9(3) VALUE 1.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA VARYING WS-I FROM 1 BY 1 UNTIL WS-I=101.
	MULTIPLY WS-SQUAREOFSUMS BY WS-SQUAREOFSUMS.
	SUBTRACT WS-SQUAREOFSUMS FROM WS-SUMOFSQUARES GIVING WS-RESULT.
	DISPLAY WS-RESULT.
	STOP RUN.

	B-PARA.
	ADD WS-I TO WS-SQUAREOFSUMS.
	COMPUTE WS-SUMOFSQUARES = WS-I * WS-I + WS-SUMOFSQUARES.
