*> Project Euler #9
*> A Pythagorean triplet is a set of three natural numbers,
*>   a < b < c, for which,
*>   a^2 + b^2 = c^2
*>
*> There exists exactly one Pythagorean triplet for which a + b + c = 1000.
*> Find the product abc.
*> Answer: 31875000
*>
*> compile with cobc -free -O -x -o euler9.exe euler9.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER9.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 A PIC 9(8) VALUE 1.
	01 B PIC 9(8) VALUE 1.
	01 C PIC 9(8) VALUE 1.

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA VARYING A FROM 1 BY 1 UNTIL A=1000.
	STOP RUN.

	B-PARA.
	PERFORM C-PARA VARYING B FROM A BY 1 UNTIL B=1000 - A.

	C-PARA.
	COMPUTE C = 1000 - (A + B).
	IF ((A * A) + (B * B)) = (C * C) THEN
		MULTIPLY A BY B
		MULTIPLY B BY C
		DISPLAY C
		STOP RUN
	END-IF.
