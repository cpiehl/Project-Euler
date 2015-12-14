#!/usr/bin/php
<?php

$number = 600851475143;
$divisor = 2;
while ($number > 1) {
	if ($number % $divisor == 0)
	{
		$number /= $divisor;
		$divisor--;
	}
	$divisor++;
}
echo $divisor . PHP_EOL;

?>