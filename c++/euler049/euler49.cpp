/* Project Euler #49
 * The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
 *   increases by 3330, is unusual in two ways: (i) each of the three terms
 *   are prime, and, (ii) each of the 4-digit numbers are permutations of one
 *   another.
 * There are no arithmetic sequences made up of three 1-, 2-, or 3-digit
 *   primes, exhibiting this property, but there is one other 4-digit
 *   increasing sequence.
 * What 12-digit number do you form by concatenating the three terms
 *   in this sequence?
 * Answer:    296962999629
*/

#include <iostream>
using namespace std;

bool is_permutation(int a, int b)
{
	bool used_digits_a[10] = {false};
	bool used_digits_b[10] = {false};
	while (a > 0)
	{
		used_digits_a[a % 10] = true;
		a /= 10;
	}
	while (b > 0)
	{
		used_digits_b[b % 10] = true;
		b /= 10;
	}
	for (int i = 0; i < 10; i++)
		if (used_digits_a[i] != used_digits_b[i])
			return false;
	return true;
}

int main()
{
	// Sieve of Eratosthenes
	const int MAX = 10000;
	bool prime[MAX];
	prime[0] = false;
	prime[1] = false;
	for (int i = 2; i < MAX; i++)
		prime[i] = true;
	for (int p = 2; p * p < MAX; p++)
	{
		if (prime[p] == true)
		{
			for (int i = p * 2; i < MAX; i += p)
				prime[i] = false;
		}
	}

	for (int i = 1001; i <= 9997; i += 2)
	{
		if (prime[i])
		{
			for (int j = i + 2; j <= 9997; j += 2)
			{
				int k = 2 * j - i;
				if (prime[j] &&	prime[k] && is_permutation(i, j) &&	is_permutation(i, k))
				{
					cout << i << j << k << endl;
				}
			}
		}
	}

	return 0;
}
