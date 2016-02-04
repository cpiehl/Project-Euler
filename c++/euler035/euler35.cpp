/* Project Euler #35
 * Find the sum of all numbers which are equal to the sum of the
 *   factorial of their digits.
 * Ex: 1! + 4! + 5! = 1 + 24 + 120 = 145
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 * Answer:    55
*/

#include <iostream>
#include <cmath>
using namespace std;

// Size prevents losing zeroes in situations like 12340 -> 01234
int rotate_number(int n, int size)
{
	if (n == 0) return 0;
	int x = 0;
	for (int i = 0; i < size; i++)
	{
		x += (n % 10) * pow(10, (i + 1) % size);
		n /= 10;
	}
	return x;
}

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

	int count = 1; // 2
	for (int p = 3; p < MAX; p += 2)
	{
		int size = log10(p) + 1;
		int x = p;
		bool found = false;
		do
		{
			x = rotate_number(x, size);
			if (!prime[x])
			{
				found = true;
				break;
			}
		} while (x != p);
		if (!found)
			count++;
	}

	cout << count << endl;

	return 0;
}

