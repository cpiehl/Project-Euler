/* Project Euler #50
 * The prime 41, can be written as the sum of six consecutive primes:
 *   41 = 2 + 3 + 5 + 7 + 11 + 13
 * This is the longest sum of consecutive primes that adds to a prime below
 *   one-hundred.
 * The longest sum of consecutive primes below one-thousand that adds to a
 * prime, contains 21 terms, and is equal to 953.
 * Which prime, below one-million, can be written as the sum of the most
 *   consecutive primes?
 * Answer:    997651
*/

#include <iostream>
using namespace std;

int main()
{
	// Sieve of Eratosthenes
	const int MAX = 1000000;
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

	int sum = 0, count = 0, max_sum = 0, max_count = 0;
	for (int i = 2; i < MAX; i++) // Consecutive start prime
	{
		if (prime[i])
		{
			count = 0;
			sum = 0;
			for (int j = i; sum + j <= MAX; j++) // Sum primes starting from i
			{
				if (prime[j])
				{
					sum += j;
					count++;
					if (prime[sum] && count > max_count)
					{
						max_count = count;
						max_sum = sum;
					}
				}
			}
		}
	}

	cout << max_sum << " : " << max_count << endl;

	return 0;
}
