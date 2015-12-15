*> What is the smallest positive number that is evenly divisible by all
*>   of the numbers from 1 to 20?
*> compile with cobc -free -O -x -o euler5.exe euler5.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER5.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-RESULT PIC 9(9) VALUE 0.
	01 WS-I PIC 9(2) VALUE 0.
	01 WS-MOD PIC 9(2) VALUE 0.
	01 WS-NULL PIC 9 VALUE 0.
	01 WS-FOUND PIC 9 VALUE 0.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA UNTIL WS-FOUND=1.
	DISPLAY WS-RESULT.
	STOP RUN.

	B-PARA.
	ADD 2520 TO WS-RESULT.
	MOVE 1 TO WS-FOUND.
	PERFORM C-PARA VARYING WS-I FROM 11 BY 1 UNTIL WS-I=20.

	C-PARA.
	DIVIDE WS-I INTO WS-RESULT GIVING WS-NULL REMAINDER WS-MOD.
	IF WS-MOD > ZERO THEN
		MOVE 0 TO WS-FOUND
	END-IF.
