/* Project Euler #45
 * Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
 *   Triangle   Tn=n(n+1)/2.
 *   Pentagonal Pn=n(3n−1)/2.
 *   Hexagonal  Hn=n(2n-1)
 * It can be verified that T_285 = P_165 = H_143 = 40755
 * Find the next triangle number that is also pentagonal and hexagonal.
 * Answer:    5482660
*/

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
	const int MAX = 32000;
	vector<unsigned long long int> pentagonals;
	for (unsigned long long int i = 0LL; i < MAX; i++)
		pentagonals.push_back(i * (3 * i - 1) / 2);

	unsigned long long int h = 0LL;
	unsigned long long int i;
	for (i = 144LL; i < MAX; i++) // Start after H_143 = 40755
	{
		// substitute n = 2m – 1 into triangle number gives hexagonal number
		// => hexagonal numbers are a subset of triangle numbers
		h = i * (2 * i - 1);
		if (binary_search(pentagonals.begin(), pentagonals.end(), h))
			break;
	}

	cout << h << " : " << i << endl;

	return 0;
}
