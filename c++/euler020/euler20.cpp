/* Project Euler #20
 * Sum the digits of 100!
 * Answer:    648
*/

#include <iostream>
using namespace std;

int main()
{
	const long long int base = 10000000000000000LL; // my Base Number
	long long int digit[10] = {0LL};
	digit[0] = 1LL;

	for (int i = 1; i <= 100; i++)
	{
		for (int k = 0; k < 10; k++)
			digit[k] *= i;
		for (int k = 0; k < 9; k++)
		{
			while (digit[k] > base)
			{
				digit[k+1] += (digit[k] / base);
				digit[k] %= base;
			}
		}
	}
	int sum = 0;
	for (int i = 0; i < 10; i++)
	{
		while (digit[i] > 0)
		{
			sum += digit[i] % 10;
			digit[i] /= 10;
		}
	}

	cout << sum << endl;

	return 0;
}

