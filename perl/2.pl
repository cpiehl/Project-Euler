#!/usr/bin/perl

$sum = 0;
$n = 1;
$lastn = 0;
while( $n < 4000000 ) {
	$newn = $n + $lastn;
	if( $newn % 2 == 0 ) {
		$sum += $newn;
	}
	$lastn = $n;
	$n = $newn;
}

print $sum, "\n";