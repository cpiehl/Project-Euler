/* Project Euler #26
 * Find the value of d < 1000 for which 1/d contains the longest recurring
 *   cycle in its decimal fraction part.
 * Ex:
 *   1/6 = 0.1(6) => 1 digit recurring cycle
 *   1/7 = 0.(142857) => 6 digit recurring cycle
 * Answer:    983
*/

#include <iostream>
using namespace std;

int main()
{
	int maxlen = 0, maxn = 0;
	maxlen = 0;
	for (int n = 2; n < 1000; n++)
	{
		int rest = 1;
		// Eg. 1/7 =>
		//   10%7=3, 30%7=2, 20%7=6, 60%7=4, 40%7=5, 50%7=1, 10%7=3
		for (int i = 0; i < n; i++)
			rest = (rest * 10) % n;
		// last remainder, Eg. 10%7=3
		// since it's a repeating sequence, the last digit is guaranteed to
		//   be in that sequence no matter how many non-sequence digits come first.
		int r0 = rest;
		int len = 0;
		// work through the sequence again until r0 is found
		do
		{
			rest = (rest * 10) % n;
			len++;
		}	while (rest != r0);
		if (len > maxlen)
		{
			maxn = n;
			maxlen = len;
		}
	}
	cout << maxn << endl;

	return 0;
}

