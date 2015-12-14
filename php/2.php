#!/usr/bin/php
<?php

$sum = 0;
$n = 1;
$lastn = 0;
while ($n < 4000000) {
	$newn = $lastn + $n;
	if ($newn % 2 == 0)
		$sum += $newn;
	$lastn = $n;
	$n = $newn;
}
echo $sum . PHP_EOL;

?>