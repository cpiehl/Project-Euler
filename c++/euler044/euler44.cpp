/* Project Euler #44
 * Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2.
 * The first ten pentagonal numbers are:
 *   1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
 * It can be seen that P4 + P7 = 22 + 70 = 92 = P8.
 * However, their difference, 70 − 22 = 48, is not pentagonal.
 * Find the pair of pentagonal numbers, Pj and Pk, for which their sum and
 *   difference are pentagonal and D = |Pk − Pj| is minimised.
 * What is the value of D?
 * Answer:    5482660
*/

#include <iostream>
#include <algorithm>
using namespace std;

int main()
{
	const int MAX = 10000;
	int pentagonals[MAX] = {0};
	for (int i = 0; i < MAX; i++)
		pentagonals[i] = i * (3 * i - 1) / 2;

	int min_d = 9999999;

	for (int j = 1; j < MAX; j++)
	{
		int pj = pentagonals[j];
		for (int k = j + 1; k < MAX; k++)
		{
			int pk = pentagonals[k];
			int d = pk - pj, s = pk + pj;
			if (binary_search(pentagonals, pentagonals + MAX, s) &&
			    binary_search(pentagonals, pentagonals + MAX, d) &&
			    d < min_d)
			{
				min_d = d;
				break;
			}
		}
	}

	cout << min_d << endl;

	return 0;
}
