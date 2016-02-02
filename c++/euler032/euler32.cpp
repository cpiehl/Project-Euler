/* Project Euler #31
 * Find the sum of all products whose multiplicand/multiplier/product
 *   identity can be written as a 1 through 9 pandigital.
 * Eg. 39 × 186 = 7254
 * Answer:    45228
*/

#include <iostream>
using namespace std;

bool isPandigital(int a, int b, int c)
{
	bool used_digits[10] = {false};
	while (a > 0)
	{
		used_digits[a % 10] = true;
		a /= 10;
	}
	while (b > 0)
	{
		used_digits[b % 10] = true;
		b /= 10;
	}
	while (c > 0)
	{
		used_digits[c % 10] = true;
		c /= 10;
	}
	if (used_digits[0])
		return false;
	else
		for (int i = 1; i < 10; i++)
			if (!used_digits[i])
				return false;
	return true;
}

int main()
{
	int sum = 0;
	for (int i = 1234; i <= 9876; i++) // 4 digit pandigital products
	{
		for (int j = 2; j < 100; j++) // 1-2 digit numbers
		{
			if (i % j == 0 && isPandigital(i, j, i/j)) // i/j => remaining 3-4 digits
			{
				sum += i;
				break;
			}
		}
	}
	cout << sum << endl;
	return 0;
}

