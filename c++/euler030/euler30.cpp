/* Project Euler #30
 * Find the sum of all the numbers that can be written as the sum of
 *   fifth powers of their digits.
 * Answer:    443839
*/

#include <iostream>
#include <math.h>
using namespace std;

int main()
{
	int result = 0;
	for (int n = 10; n < 1000000; n++)
	{
		int sum = 0;
		int num = n;
		while (num > 0)
		{
			sum += pow(num % 10, 5);
			num /= 10;
		}
		if (sum == n)
			result += n;
	}

	cout << result << endl;
	return 0;
}

