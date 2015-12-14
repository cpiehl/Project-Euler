-- Find the largest palindrome made from the product of two 3-digit numbers.
-- compile with gnatmake euler4.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler4 is
	result : integer := -1;
	num : integer := 0;
	rev : integer := 0;
begin
	for x in Integer range 100..999 loop
		for y in Integer range 100..999 loop
			num := x * y;
			rev := 0;
			while num > 0 loop
				rev := (rev * 10) + (num mod 10);
				num := num / 10;
			end loop;
			num := x * y;
			if (num = rev and then num > result) then
				result := num;
			end if;
		end loop;
	end loop;
	Put_Line(natural'image(result));
end Euler4;