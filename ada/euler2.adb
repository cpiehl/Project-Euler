-- Sums all numbers divisible by 3 or 5 under 1000
-- compile with gnatmake euler1.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler2 is
	sum : integer := 0;
	n : integer := 1;
	lastn : integer := 0;
	newn : integer := 0;
begin
	while n < 4000000 loop
		newn := n + lastn;
		if newn mod 2 = 0 then
			sum := sum + newn;
		end if;
		lastn := n;
		n := newn;
	end loop;
	Put_Line(natural'image(sum));
end Euler2;