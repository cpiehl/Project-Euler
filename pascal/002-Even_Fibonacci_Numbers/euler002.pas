{*
Find the sum of the even-valued Fibonacci terms under 4 million
Answer: 4613732
*}
program Euler002;
uses crt;

var
sum,n,newn,lastn : int32;

begin
	sum := 0;
	n := 1;
	lastn := 0;
	while n + lastn < 4000000 do begin
		newn := n + lastn;
		if (not odd(newn)) then begin
			sum := sum + newn;
		end;
		lastn := n;
		n := newn;
	end;
	WriteLn(sum);
end.