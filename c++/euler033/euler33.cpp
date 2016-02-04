/* Project Euler #33
 * 49/98 = 4/8, by "cancelling" the 9's
 * 30/50 = 3/5 by "cancelling" the 0's, considered trivial
 * Exactly 4 non-trivial examples of this exist, less than one in value,
 *   and containing two digits in the numerator and denominator
 * Find the denominator of the simplified product of these four fractions
 * Answer:    100
*/

#include <iostream>
using namespace std;

int main()
{
	int n_result = 1, d_result = 1;
	for (int n = 1; n <= 8; n++) // numerators
	{
		for (int d = n + 1; d <= 9; d++) // denominators, start at n+1 so n/d<1
		{
			for (int k = n; k <= 9; k++)
			{
				int nk = n * 10 + k;
				int kd = k * 10 + d;
				if (d * nk == n * kd)
				{
					n_result *= n;
					d_result *= d;
				}
			}
		}
	}

	// Simplify by dividing by common factors
	for (int i = 2; n_result > 1 && d_result > 1; i++)
	{
		while (n_result % i == 0 && d_result % i == 0)
		{
			n_result /= i;
			d_result /= i;
		}
	}
	cout << d_result << endl;
	return 0;
}
