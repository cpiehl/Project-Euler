/* Project Euler #37
 * 3797 is prime, and can be truncated from left to right and remain prime.
 * Eg. 3797, 797, 97, and 7 are all prime
 * Similarly 3797 can be truncated from right to left.
 * Eg. 3797, 379, 37, and 3 are all prime
 * Find the sum of the only eleven primes that are both truncatable from
 *   left to right and right to left.
 * NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
 * Answer:    748317
*/

#include <iostream>
using namespace std;

int pow10[10] = {
	1, 10, 100, 1000, 10000,
	100000, 1000000, 10000000, 100000000, 1000000000
};

int main()
{
	// Sieve of Eratosthenes
	const int MAX = 1000000;
	bool prime[MAX + 1];
	prime[0] = false;
	prime[1] = false;
	for (int i = 2; i <= MAX; i++)
		prime[i] = true;
	for (int p = 2; p * p < MAX; p++)
	{
		if (prime[p] == true)
		{
			for (int i = p * 2; i < MAX; i += p)
				prime[i] = false;
		}
	}

	int sum = 0;
	int count = 0;

	for (int p = 11; p < MAX && count <= 11; p += 2)
	{
		bool isprime_trunc = true;
		int exp = 0;
		int j = 0;
		for (int i = p; i > 0; i /= 10) // truncate right to left
		{
			j += pow10[exp] * (i % 10); // rebuild number right to left
			exp++;
			if (!prime[i] || !prime[j])
			{
				isprime_trunc = false;
				break;
			}
		}
		if (isprime_trunc)
		{
			sum += p;
			count++;
		}
	}

	cout << count << " truncatable primes found, sum = " << sum << endl;

	return 0;
}

