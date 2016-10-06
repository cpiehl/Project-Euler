{*
What is the largest prime factor of the number 600851475143 ?
Answer: 6857
*}
program Euler003;

var
number,divisor : int64;

begin
	number := 600851475143;
	while ((not odd(number)) and (number > 1)) do begin
		number := number div 2; { IMPORTANT! div does int division }
	end;
	divisor := 3;
	while number > 1 do begin
		if (0 = number mod divisor) then begin
			number := number div divisor;
		end else begin
			divisor := divisor + 2;
		end;
	end;

	WriteLn(divisor);
end.