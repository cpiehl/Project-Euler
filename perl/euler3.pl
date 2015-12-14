#!/usr/bin/perl

$number = 600851475143;
$divisor = 2;
while( $number > 1 ) {
	if( $number % $divisor == 0 ) {
		$number /= $divisor;
		$divisor--;
	}
	$divisor++;
}

print $divisor, "\n";