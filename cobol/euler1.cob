*> Sums all numbers divisible by 3 or 5 under 1000
*> compile with cobc -free -O -x -o euler1.exe euler1.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER1.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-A PIC 9(4) VALUE 0.
	01 WS-SUM PIC 9(6) VALUE 0.
	01 WS-DIV PIC 9 VALUE 0.
	01 WS-MOD3 PIC 9 VALUE 0.
	01 WS-MOD5 PIC 9 VALUE 0.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA VARYING WS-A FROM 1 BY 1 UNTIL WS-A=1000
	DISPLAY WS-SUM.
	STOP RUN.

	B-PARA.
	DIVIDE WS-A BY 3 GIVING WS-DIV REMAINDER WS-MOD3.
	DIVIDE WS-A BY 5 GIVING WS-DIV REMAINDER WS-MOD5.
	IF WS-MOD3 = ZERO OR WS-MOD5 = ZERO THEN
		ADD WS-A TO WS-SUM
	END-IF.
