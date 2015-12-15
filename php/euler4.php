#!/usr/bin/php
<?php

$result = -1;
for ($x = 100; $x < 1000; $x++) {
	for ($y = 100; $y < 1000; $y++) {
		$num = $x * $y;
		if (strval($num) == strrev(strval($num)) && $num > $result)
		{
			$result = $num;
			break;
		}
	}
}
echo $result . PHP_EOL;

?>