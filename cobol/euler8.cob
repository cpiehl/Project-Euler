*> Project Euler #8
*> The four adjacent digits in the 1000-digit number that
*>   have the greatest product are 9 × 9 × 8 × 9 = 5832.
*> 73167176531330624919225119674426574742355349194934
*> 96983520312774506326239578318016984801869478851843
*> 85861560789112949495459501737958331952853208805511
*> 12540698747158523863050715693290963295227443043557
*> 66896648950445244523161731856403098711121722383113
*> 62229893423380308135336276614282806444486645238749
*> 30358907296290491560440772390713810515859307960866
*> 70172427121883998797908792274921901699720888093776
*> 65727333001053367881220235421809751254540594752243
*> 52584907711670556013604839586446706324415722155397
*> 53697817977846174064955149290862569321978468622482
*> 83972241375657056057490261407972968652414535100474
*> 82166370484403199890008895243450658541227588666881
*> 16427171479924442928230863465674813919123162824586
*> 17866458359124566529476545682848912883142607690042
*> 24219022671055626321111109370544217506941658960408
*> 07198403850962455444362981230987879927244284909188
*> 84580156166097919133875499200524063689912560717606
*> 05886116467109405077541002256983155200055935729725
*> 71636269561882670428252483600823257530420752963450
*> Find the thirteen adjacent digits in the 1000-digit number that
*>   have the greatest product. What is the value of this product?
*> Answer: 23514624000
*> compile with cobc -free -O -x -o euler8.exe euler8.cob
*> -free - use free source format. without cobol requires certain format
*> -x - build executable
*> -O - optimize
*> -o - output file

IDENTIFICATION DIVISION.
PROGRAM-ID. EULER8.

DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-BIGPROD PIC 9(11) VALUE 0.
	01 WS-PROD PIC 9(11) VALUE 1.
	01 WS-I PIC 9(4) VALUE 0.
	01 WS-J PIC 9(4) VALUE 0.
	01 WS-N PIC 9(4) VALUE 0.
	01 WS-M PIC 9(4) VALUE 0.
	01 WS-CHAR PIC X(1) VALUE " ".
	01 WS-BIGNUM PIC X(1002) VALUE "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450".

PROCEDURE DIVISION.
	A-PARA.
	PERFORM B-PARA VARYING WS-I FROM 0 BY 1 UNTIL WS-I=988.
	DISPLAY WS-BIGPROD.
	STOP RUN.

	B-PARA.
	MOVE 1 TO WS-PROD.
	PERFORM C-PARA VARYING WS-J FROM 0 BY 1 UNTIL WS-J=13.
	IF WS-PROD > WS-BIGPROD THEN
		MOVE WS-PROD TO WS-BIGPROD
	END-IF.

	C-PARA.
	COMPUTE WS-N = WS-I + WS-J.
	COMPUTE WS-M = WS-I + WS-J + 1.
	MOVE WS-BIGNUM(WS-N:WS-M) TO WS-CHAR.
	COMPUTE WS-PROD = WS-PROD * FUNCTION NUMVAL(WS-CHAR).