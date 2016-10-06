{*
Find the sum of all the multiples of 3 or 5 below 1000.
Answer: 233168
*}
program Euler001;

var
sum,i : int32;

begin
	sum := 0;
	i := 3;
	while i <= 999 do	begin
		sum := sum + i;
		i := i + 3;
	end;
	i := 5;
	while i <= 999 do	begin
		sum := sum + i;
		i := i + 15;
	end;
	i := 10;
	while i <= 999 do	begin
		sum := sum + i;
		i := i + 15;
	end;
	WriteLn(sum);
end.