#!/usr/bin/php
<?php
/* Project Euler #6
 * Find the difference between the sum of the squares of the first one
 *   hundred natural numbers and the square of the sum.
 * Answer: 25164150
*/

$squareofsums = 0;
$sumofsquares = 0;
for ($i = 1; $i < 101; $i++) {
	$squareofsums += $i;
	$sumofsquares += $i * $i;
}
$squareofsums *= $squareofsums;
echo ($squareofsums - $sumofsquares) . PHP_EOL;

?>