/* Project Euler #14
 * Collatz iterative sequence defined as:
 *   n -> n/2 if n is even
 *   n -> 3n + 1 if n is odd
 *
 * Which starting number, under one million, produces the longest chain?
 * Answer:   	837799
*/

#include <iostream>
#include <map>
using namespace std;

int main()
{
	const unsigned int MAX = 1000000;
	map<unsigned int,unsigned int> collatz_lengths;
	int length, maxlen = 0, n_maxlen = -1;
	for (unsigned int n = 2; n < MAX; n++)
	{
		// Calculate Collatz series length
		length = 1;
		for (unsigned int x = n; x != 1; )
		{
			if (collatz_lengths[x] != 0) // Already found
			{
				length += collatz_lengths[x] - 1;
				break;
			}
			else
			{
				if (x % 2 == 0)
					x = x / 2;
				else
					x = (3 * x) + 1;
				length++;
			}
		}

		collatz_lengths[n] = length;

		if (length > maxlen)
		{
			maxlen = length;
			n_maxlen = n;
		}
	}
	cout << "Max: " << n_maxlen << " -> " << maxlen << endl;
	return 0;
}

