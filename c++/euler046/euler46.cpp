/* Project Euler #46
 * It was proposed by Christian Goldbach that every odd composite number
 *   can be written as the sum of a prime and twice a square.
 *   9 = 7 + 2×1*1
 *   15 = 7 + 2×2*2
 *   21 = 3 + 2×3*3
 *   25 = 7 + 2×3*3
 *   27 = 19 + 2×2*2
 *   33 = 31 + 2×1*1
 * It turns out that the conjecture was false.
 * What is the smallest odd composite that cannot be written as the sum of
 *   a prime and twice a square?
 * Answer:    5777
*/

#include <iostream>
#include <algorithm>
using namespace std;

int main()
{
	const int MAX = 10000;
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

	// Generate sorted list of squares for quick binary_search retrieval
	int squares[100];
	for (int i = 0; i < 100; i++)
		squares[i] = i * i;

	for (int i = 9; i < MAX; i += 2) // odds only
	{
		if (!prime[i]) // composite
		{
			int j;
			for (j = i; j > 0; j -= 2) // test decreasing primes
			{
				// composite = prime + 2 * square
				// i = j + 2 * square
				// square = (i - j) / 2
				if (prime[j] && binary_search(squares, squares+100, (i - j) / 2))
				{
					break;
				}
			}
			if (j < 0) // didn't find any working combination
			{
				cout << i << endl;
				break;
			}
		}
	}

	return 0;
}
