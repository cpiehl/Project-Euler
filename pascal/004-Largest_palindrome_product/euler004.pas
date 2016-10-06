{*
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers
is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.

Answer: 906609
*}
program Euler004;

var
result,x,y,num,rev : int32;

begin
	result := -1;
	x := 100;
	while (x < 1000) do begin
		y := 100;
		while (y < 1000) do begin
			num := x * y;
			rev := 0;
			while (num > 0) do begin
				rev := (rev * 10) + (num mod 10);
				num := num div 10;
			end;
			num := x * y;
			if (num = rev) and (num > result) then begin
				result := num;
				break;
			end;
			y := y + 1;
		end;
		x := x + 1;
	end;

	WriteLn(result);
end.
