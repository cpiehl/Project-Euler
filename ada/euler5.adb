-- Project Euler --5
-- 2520 is the smallest number that can be divided by each of the numbers
--   from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all
--   of the numbers from 1 to 20?
-- Answer: 232792560
-- Compile with gnatmake euler5.adb
with Ada.Text_IO; use Ada.Text_IO;
procedure Euler5 is
	function GCD(A, B: Long_Integer) return Long_Integer is
	begin
		if B = 0 then
			return A;
		end if;
		if B > A then
			return GCD(B, A);
		else
			return GCD(B, A mod B);
		end if;
	end GCD;

	function LCM(A, B: Long_Integer) return Long_Integer is
	begin
		return A * B / GCD(A, B);
	end LCM;

	result : Long_Integer := 2;
begin
	for i in Long_Integer range 11..20 loop
		result := result * i / GCD(result, i);
	end loop;
	Put_Line(Long_Integer'image(result));
end Euler5;
