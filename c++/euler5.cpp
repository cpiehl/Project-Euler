/* Project Euler #5
 * 2520 is the smallest number that can be divided by each of the numbers
 *   from 1 to 10 without any remainder.
 * What is the smallest positive number that is evenly divisible by all
 *   of the numbers from 1 to 20?
 * Answer: 232792560
*/

#include <iostream>

int main()
{
	long result = 0;
	bool found = false;
	while (!found)
	{
		result += 2520; // increment by value divisible by 1-10
		found = true;
		for (int i = 11; i <= 20; i++) // check divisible by 11-20
		{
			if (result % i != 0)
			{
				found = false;
				break;
			}
		}
	}
	std::cout << result << std::endl;
	return 0;
}

