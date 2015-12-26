-- Project Euler #10
-- Find the sum of all the primes below two million.
-- Answer:	142913828922

with Ada.Text_IO; use Ada.Text_IO;
procedure Euler10 is
	MAX : long_integer := 2000000;
	type bool_array is array(1..MAX) of boolean;
	marked : bool_array := (others => false);
	value : long_integer := 3;
	s : long_integer := 2;
	i : long_integer := 3;
begin
	marked(2) := true;
	while value < MAX loop
		if not marked(value) then
			s := s + value;
			i := value;
			while i < MAX loop
				marked(i) := true;
				i := i + value;
			end loop;
		end if;
		value := value + 2;
	end loop;
	Put_Line(Long_Integer'image(s));
end Euler10;
