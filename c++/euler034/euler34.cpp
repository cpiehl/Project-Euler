/* Project Euler #34
 * Find the sum of all numbers which are equal to the sum of the
 *   factorial of their digits.
 * Ex: 1! + 4! + 5! = 1 + 24 + 120 = 145
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 * Answer:    40730
*/

#include <iostream>
using namespace std;

int main()
{
	int factorials[10];
	factorials[0] = 1;
	for (int i = 1; i <= 9; i++)
		factorials[i] = factorials[i - 1] * i;

	int result = 0;
	for (int i = 3; i < factorials[9]; i++)
	{
		int n = i;
		int sum = 0;
		while (n > 0)
		{
			sum += factorials[n % 10];
			n /= 10;
		}
		if (sum == i)
			result += sum;
	}

	cout << result << endl;

	return 0;
}

