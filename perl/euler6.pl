#!/usr/bin/perl
# Project Euler #6
# Find the difference between the sum of the squares of the first one
#   hundred natural numbers and the square of the sum.
# Answer: 25164150


my $squareofsums = 0;
my $sumofsquares = 0;
foreach (1..100)
{
	$squareofsums += $_;
	$sumofsquares += $_*$_;
}
$squareofsums *= $squareofsums;

print $squareofsums - $sumofsquares, "\n";
