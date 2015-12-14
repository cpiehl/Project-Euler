#!/usr/bin/php
<?php

$result = -1;
for ($x = 100; $x < 999; $x++) {
	for ($y = 100; $y < 999; $y++) {
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