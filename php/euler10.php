#!/usr/bin/php
<?php
/* Project Euler #10
 * Find the sum of all the primes below two million.
 * Answer:  142913828922
*/

$MAX = 2000000;
$marked = str_repeat('f', $MAX);
$value = 3;
$s = 2;
while ($value < $MAX)
{
	if ($marked[$value] == 'f')
	{
		$s += $value;
		$i = $value;
		while ($i < $MAX)
		{
			$marked[$i] = 't';
			$i += $value;
		}
	}
	$value += 2;
}
echo ($s) . PHP_EOL;

?>