#!/usr/bin/perl
# Project Euler #7
# What is the 10 001st prime number?
# Answer: 104743

my $i = 3;
my $n = 1;
my $s = 1;
my $x = 0;
while ($i <= 10001)
{
	if ($s == 1)
	{
		$x = 6 * $n - 1;
		$s = 0;
	} else {
		$x = 6 * $n + 1;
		$s = 1;
		$n = $n + 1;
	}
	my $r = $x**0.5;
	my $p = 1;
	my $t = 3;
	while ($t <= $r)
	{
		if ($x % $t == 0)
		{
			$p = 0;
		}
		$t += 2;
	}
	if ($p == 1)
	{
		$i++;
	}
}

print $x, "\n";
