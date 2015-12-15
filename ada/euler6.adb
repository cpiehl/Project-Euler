-- Project Euler #6
-- Find the difference between the sum of the squares of the first one
--   hundred natural numbers and the square of the sum.
-- Answer: 25164150
-- Compile with gnatmake euler5.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler6 is
	squareofsums : integer := 0;
	sumofsquares : integer := 0;
begin
	for i in integer range 1..100 loop
		squareofsums := squareofsums + i;
		sumofsquares := sumofsquares + i * i;
	end loop;
	squareofsums := squareofsums * squareofsums;
	Put_Line(integer'image(squareofsums - sumofsquares));
end Euler6;
