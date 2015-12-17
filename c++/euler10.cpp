/* Project Euler #10
 * Find the sum of all the primes below two million.
 * Answer:  142913828922
*/

#include <iostream>

int main()
{
	const int MAX = 2000000;
	bool marked[MAX];
	int value = 3;
	long long int s = 2;
	for (int i = 0; i < MAX ; i++) marked[i] = false;
	while (value < MAX)
	{
		if (!marked[value])
		{
			s += value;
			int i = value;
			while (i < MAX)
			{
				marked[i] = true;
				i += value;
			}
		}
		value += 2;
	}
	std::cout << s << std::endl;
	return 0;
}

