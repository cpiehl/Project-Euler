*> Project Euler #10
*> Find the sum of all the primes below two million.
*> Answer:  142913828922
*>
*> compile with cobc -free -O -x -o euler10.exe euler10.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER10.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 MAX PIC 9(12) VALUE 2000000.
	01 VAL PIC 9(12) VALUE 3.
	01 S PIC 9(12) VALUE 2.
	01 I PIC 9(12) VALUE 0.
	01 WS-TABLE.
		05 MARKED PIC 9(1) VALUE 0 OCCURS 2000000 TIMES.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA UNTIL VAL >= MAX.
	DISPLAY S.
	STOP RUN.

	B-PARA.
	IF MARKED(VAL) = 0 THEN
		COMPUTE S = S + VAL
		MOVE VAL TO I
		PERFORM C-PARA UNTIL I >= MAX
	END-IF.
	COMPUTE VAL = VAL + 2.

	C-PARA.
	MOVE 1 TO MARKED(I).
	COMPUTE I = I + VAL.
