-- Project Euler #7
-- What is the 10001st prime number?
-- Answer: 104743
-- Compile with gnatmake euler7.adb
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
procedure Euler7 is
	i : integer := 3;
	n : integer := 1;
	s : integer := 1;
	x : integer := 0;
	r : float := 0.0;
	p : integer := 0;
	t : integer := 0;
begin
	while i <= 10001 loop
		if s = 1 then
			x := 6 * n - 1;
			s := 0;
		else
			x := 6 * n + 1;
			s := 1;
			n := n + 1;
		end if;
		r := Ada.Numerics.Elementary_Functions.Sqrt(Float(x));
		p := 1;
		t := 3;
		while Float(t) <= r loop
			if x mod t = 0 then
				p := 0;
			end if;
			t := t + 2;
		end loop;
		if p = 1 then
			i := i + 1;
		end if;
	end loop;
	Put_Line(integer'image(x));
end Euler7;
