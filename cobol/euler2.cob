*> Sums all even members of fibonacci under 4 million
*> compile with cobc -free -O -x -o euler2.exe euler2.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER2.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-N PIC 9(7) VALUE 1.
	01 WS-LASTN PIC 9(7) VALUE 0.
	01 WS-NEWN PIC 9(7) VALUE 0.
	01 WS-SUM PIC 9(7) VALUE 0.
	01 WS-DIV PIC 9 VALUE 0.
	01 WS-MOD2 PIC 9 VALUE 0.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA UNTIL WS-N > 4000000.
	DISPLAY WS-SUM.
	STOP RUN.

	B-PARA.
	COMPUTE WS-NEWN = WS-N + WS-LASTN.
	DIVIDE WS-NEWN BY 2 GIVING WS-DIV REMAINDER WS-MOD2.
	IF WS-MOD2 = ZERO THEN
		ADD WS-NEWN TO WS-SUM
	END-IF.
	MOVE WS-N TO WS-LASTN.
	MOVE WS-NEWN TO WS-N.
