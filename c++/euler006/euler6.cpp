/* Project Euler #6
 * Find the difference between the sum of the squares of the first one
 *   hundred natural numbers and the square of the sum.
 * Answer: 25164150
*/

#include <iostream>

int main()
{
	long squareofsums = 0;
	long sumofsquares = 0;
	for (int i = 1; i < 101; i++)
	{
		squareofsums += i;
		sumofsquares += i*i;
	}
	squareofsums *= squareofsums;

	std::cout << squareofsums - sumofsquares << std::endl;
	return 0;
}

