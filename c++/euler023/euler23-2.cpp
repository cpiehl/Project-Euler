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
#include <vector>
using namespace std;

bool is_abundant(int n)
{
	int prod = 1;
	for (int k = 2; k * k <= n; k++)
	{
		int p = 1;
		while (n % k == 0)
		{
			p = p * k + 1;
			n /= k;
		}
		prod *= p;
	}
	if (n > 1)
		prod *= 1 + n;
	return prod > (n + n);
}

int main()
{
	vector<int> abundants;
	for (int i = 12; i < 28111; i++) // All possible/needed abundants
		if (is_abundant(i))
			abundants.push_back(i);

	bool sum_of_abundants[28123 * 2 + 1] = {false};
	for (unsigned int i = 0; i < abundants.size(); i++)
		for (unsigned int j = 0; j <= i; j++)
			sum_of_abundants[abundants[i] + abundants[j]] = true;

	int sum = 0;
	for (int i = 1; i < 28123; i++)
		if (!sum_of_abundants[i])
			sum += i;

	cout << sum << endl;

	return 0;
}

