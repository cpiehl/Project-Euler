#!/usr/bin/perl
# Project Euler #10
# Find the sum of all the primes below two million.
# Answer:	142913828922

my $MAX = 2000000;
my $marked = 0 for (1..$MAX);
my $value = 3;
my $s = 2;
my $i = 0;
while ($value < $MAX)
{
	if ($marked[$value] == 0)
	{
		$s += $value;
		$i = $value;
		while ($i < $MAX)
		{
			$marked[$i] = 1;
			$i += $value;
		}
	}
	$value += 2;
}
print $s, "\n";
