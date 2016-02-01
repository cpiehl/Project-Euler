/* Project Euler #23
 * A perfect number is a number for which the sum of its proper divisors
 *   is exactly equal to the number.
 * For example, the sum of the proper divisors of 28 would be
 *   1 + 2 + 4 + 7 + 14 = 28
 *   which means that 28 is a perfect number.
 * A number n is called deficient if the sum of its proper divisors is
 *   less than n and it is called abundant if this sum exceeds n.
 * 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16
 * All integers greater than 28123 can be written as the sum of two abundant
 *   numbers.
 * Find the sum of all the positive integers which cannot be written as
 *   the sum of two abundant numbers.
 * Answer:    4179871
*/

#include <iostream>
using namespace std;

bool isAbundant(int n)
{
	int sum = 0;
	for (int i = 1; i <= n/2; i++)
		if (n % i == 0)
			sum += i;
	return sum > n;
}

int main()
{
	bool abundants[28123] = {false};
	for (int i = 0; i < 28123; i++)
		abundants[i] = isAbundant(i);

	bool found;
	int sum = 0;
	for (int i = 1; i < 28123; i++) // Smallest to biggest possible sums
	{
		found = false;
		for (int j = 12; j < i; j++) // Smallest to biggest needed abundants
		{
			if (abundants[j] && abundants[i - j])
			{
				found = true;
				break;
			}
		}
		if (!found)
			sum += i;
	}
	cout << sum << endl;

	return 0;
}

