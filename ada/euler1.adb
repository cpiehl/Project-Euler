-- Sums all numbers divisible by 3 or 5 under 1000
-- compile with gnatmake euler1.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler1 is
	sum : integer := 0;
begin
	for i in integer range 1 .. 999 loop
		if i mod 3 = 0 or i mod 5 = 0 then
			sum := sum + i;
		end if;
	end loop;
	Put_Line(natural'image(sum));
end Euler1;