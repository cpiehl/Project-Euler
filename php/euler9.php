#!/usr/bin/php
<?php
/* Project Euler #9
 * A Pythagorean triplet is a set of three natural numbers,
 *   a < b < c, for which,
 *   a^2 + b^2 = c^2
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 * Answer: 31875000
*/

for ($a = 1; $a <= 1000; $a++)
{
	for ($b = $a + 1; $b <= 1000 - $a; $b++)
	{
		$c = 1000 - ($a + $b);
		if ($a*$a + $b*$b == $c*$c)
		{
			echo ($a * $b * $c) . PHP_EOL;
		}
	}
}


?>