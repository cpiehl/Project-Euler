#!/usr/bin/php
<?php
/* Project Euler #7
 * What is the 10001st prime number?
 * Answer: 104743
*/

$i = 3;
$n = 1;
$s = 1;
$x = 0;
while ($i <= 10001)
{
	if ($s == 1)
	{
		$x = 6 * $n - 1;
		$s = 0;
	} else {
		$x = 6 * $n + 1;
		$s = 1;
		$n = $n + 1;
	}
	$r = $x**0.5;
	$p = 1;
	$t = 3;
	while ($t <= $r)
	{
		if ($x % $t == 0)
		{
			$p = 0;
		}
		$t += 2;
	}
	if ($p == 1)
	{
		$i++;
	}
}
echo ($x) . PHP_EOL;

?>