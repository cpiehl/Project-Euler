/* Project Euler #47
 * The first two consecutive numbers to have two distinct prime factors are:
 *   14 = 2 × 7
 *   15 = 3 × 5
 * The first three consecutive numbers to have three distinct prime factors are:
 *   644 = 2² × 7 × 23
 *   645 = 3 × 5 × 43
 *   646 = 2 × 17 × 19
 * Find the first four consecutive integers to have four distinct prime factors.
 * What is the first of these numbers?
 * Answer:    134043
*/

#include <iostream>
#include <vector>
using namespace std;

int number_of_prime_factors(int n, vector<int>* primes)
{
	int count = 0;
	for (auto p = (*primes).begin(); p != (*primes).end(); ++p)
	{
		if (n % *p == 0)
		{
			while (n % *p == 0)
				n /= *p;
			count++;
		}
	}
	return count;
}

int main()
{
	// Sieve up some primes
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
	// Stick them all in a vector
	vector<int> primes;
	primes.push_back(2);
	for (int p = 3; p < MAX; p += 2)
		if (prime[p])
			primes.push_back(p);

	//~ delete [] prime;

	int count = 1; // consecutive integers with 4 prime factors
	for (int i = 2*3*5*7 + 1; i < MAX * MAX; i++)
	{
		if (number_of_prime_factors(i, &primes) >= 4)
			count++;
		else
			count = 0;
		if (count == 4)
		{
			cout << i - 3 << endl; // output first of the 4
			break;
		}
	}

	return 0;
}
