{*
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers
is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.

Answer: 913 * 993 = 906609

This version starts by generating a 6-digit palindromic number,
then determines if it is divisible by two 3-digit numbers.
This is significantly faster (~60x!) than reversing thousands of numbers
with modulus just to determine if they're even palindromes.
*}
program Euler004;

var
num,a,b,c,n,q : int32;
found : boolean;

begin
	found := false;
	num := 0;
	a := 9;
	while ((0 <= a) and not found) do begin
		b := 9;
		while ((0 <= b) and not found) do begin
			c := 9;
			while ((0 <= c) and not found) do begin
				num := a * 100000 + { generate palindrome ABCCBA }
				       b * 10000 +
				       c * 1000 +
				       c * 100 +
				       b * 10 +
				       a;
				n := 999;  { 3 digit number, 100 < n < 1000 }
				while (100 < n) do begin
					q := num div n; { store quotient to save a modulus }
					if ((1000 > q) and (0 = num - (n * q))) then begin
						found := true;
						break;
					end;
					n := n - 1;
				end;
				c := c - 1;
			end;
			b := b - 1;
		end;
		a := a - 1;
	end;

	WriteLn(num);
end.
