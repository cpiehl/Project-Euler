#!/usr/bin/perl

$result = -1;
for ($x = 100; $x < 1000; $x++) {
	for ($y = 100; $y < 1000; $y++) {
		$num = $x * $y;
		if (($num == reverse $num) && $num > $result) {
			$result = $num;
			break;
		}
	}
}

print $result, "\n";