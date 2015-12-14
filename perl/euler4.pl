#!/usr/bin/perl

$result = -1;
for ($x = 100; $x < 999; $x++) {
	for ($y = 100; $y < 999; $y++) {
		$num = $x * $y;
		if (($num == reverse $num) && $num > $result) {
			$result = $num;
			break;
		}
	}
}

print $result, "\n";