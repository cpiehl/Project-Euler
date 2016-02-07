/* Project Euler #48
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 * Answer:    9110846700
*/

#include <iostream>
using namespace std;

int main()
{
	unsigned long long int result = 0;
	unsigned long long int modulo = 10000000000; // 1E10

	for (int i = 1; i <= 1000; i++)
	{
		unsigned long long int temp = i;
		for (int j = 1; j < i; j++)
		{
			temp *= i;
			temp %= modulo; // Truncate to 10 digits
		}

		result += temp;
		result %= modulo; // Truncate to 10 digits
	}

	cout << result << endl;

	return 0;
}
