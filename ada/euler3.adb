-- Sums all numbers divisible by 3 or 5 under 1000
-- compile with gnatmake euler1.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler3 is
	number : Long_Integer := 600851475143;
	divisor : Long_Integer := 2;
begin
	while number > 1 loop
		if number mod divisor = 0 then
			number := number / divisor;
			divisor := divisor - 1;
		end if;
		divisor := divisor + 1;
	end loop;
	Put_Line(Long_Integer'image(divisor));
end Euler3;