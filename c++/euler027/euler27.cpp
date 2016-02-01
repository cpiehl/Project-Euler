/* Project Euler #27
 * Considering quadratics of the form:
 *   n² + an + b, where |a| < 1000 and |b| < 1000
 * Find the product of the coefficients, a and b, for the quadratic expression
 *   that produces the maximum number of primes for consecutive values of n,
 *   starting with n = 0.
 * Answer:    -59231
*/

#include <iostream>
#include <math.h>
using namespace std;

int main()
{
	const int MAX = 1000;
	int n = 1;
	int s = 1;
	int x;
	bool primes[MAX];
	while (x < MAX)
	{
		if (s == 1)
		{
			x = 6 * n - 1;
			s = 0;
		} else {
			x = 6 * n + 1;
			s = 1;
			n++;
		}
		primes[x] = true;
		int t = 3;
		while (t * t <= x)
		{
			if (x % t == 0)
			{
				primes[x] = false;
				break;
			}
			t += 2;
		}
	}

	int a_max = 0, b_max = 0, n_max = 0;

	for (int a = -1000; a <= 1000; a++)
	{
		for (int b = -1000; b <= 1000; b++)
		{
			int n = 0;
			while (primes[abs(n * (n + a) + b)])
				n++;
			if (n > n_max)
			{
				a_max = a;
				b_max = b;
				n_max = n;
			}
		}
	}

	cout << a_max * b_max << endl;

	return 0;
}

