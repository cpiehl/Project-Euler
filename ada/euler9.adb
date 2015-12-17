-- Project Euler #9
-- A Pythagorean triplet is a set of three natural numbers,
--   a < b < c, for which,
--   a^2 + b^2 = c^2
--
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.
-- Answer: 31875000
-- Compile with gnatmake euler9.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler9 is
	a : Integer := 1;
	b : Integer := 1;
	c : Integer := 1;
begin
	for a in Integer range 1..1000 loop
		for b in Integer range a..1000-a loop
			c := 1000 - (a + b);
			if a*a + b*b = c*c then
				Put_Line(Integer'Image(a * b * c));
			end if;
		end loop;
	end loop;
end Euler9;
