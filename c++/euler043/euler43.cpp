/* Project Euler #43
 * The number, 1406357289, is a 0 to 9 pandigital number because it is made
 *   up of each of the digits 0 to 9 in some order, but it also has a rather
 *   interesting sub-string divisibility property.
 * Let d1 be the 1st digit, d2 be the 2nd digit, and so on.
 *   d2d3d4=406 is divisible by 2
 *   d3d4d5=063 is divisible by 3
 *   d4d5d6=635 is divisible by 5
 *   d5d6d7=357 is divisible by 7
 *   d6d7d8=572 is divisible by 11
 *   d7d8d9=728 is divisible by 13
 *   d8d9d10=289 is divisible by 17
 * Find the sum of all 0 to 9 pandigital numbers with this property.
 * Answer:    16695334890
*/

#include <iostream>
#include <algorithm>
using namespace std;

static unsigned int pow10[10] = {
	1, 10, 100, 1000, 10000, 100000, 1000000,
	10000000, 100000000, 1000000000
};

static int primes[7] = {
	2, 3, 5, 7, 11, 13, 17
};

bool is_pandigital(int n[])
{
	bool used_digits[10] = {false};
	for (unsigned int i = 0; i < 10; i++)
		used_digits[n[i]] = true;
	for (unsigned int i = 0; i < 10; i++)
		if (!used_digits[i])
			return false;
	return true;
}

int main()
{
	long long int sum = 0LL;
	int pandigital[10] = {1, 0, 2, 3, 4, 5, 6, 7, 8, 9};

	do
	{
		if (is_pandigital(pandigital))
		{
			bool found = false;
			for (int i = 1; i <= 7; i++)
			{
				int n = 100 * pandigital[i] + 10 * pandigital[i+1] + pandigital[i+2];
				if (n % primes[i - 1] != 0)
				{
					found = true;
					break;
				}
			}
			if (!found)
				for (int i = 0; i < 10; i++)
					sum += pow10[10 - i - 1] * pandigital[i];
		}
	} while (next_permutation(pandigital, pandigital+10));

	cout << sum << endl;

	return 0;
}
