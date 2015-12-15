#!/usr/bin/perl
# Project Euler #5
# 2520 is the smallest number that can be divided by each of the numbers
#   from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all
#   of the numbers from 1 to 20?
# Answer: 232792560

my $result = 2;
foreach (11..20) {
	$result = lcm($result, $_);
}

print $result, "\n";

sub lcm {
	($m, $n) = @_;
	$gcd = gcd($m, $n);
	return $m * $n / $gcd;
}

sub gcd {
	my($a, $b) = @_;
	return $a if $b == 0;
	if($b > $a) {
		gcd($b, $a);
	} else {
		$a = $a % $b;
		gcd($b, $a);
	}
}