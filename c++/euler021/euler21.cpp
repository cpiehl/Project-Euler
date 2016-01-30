/* Project Euler #21
 * Let d(n) be defined as the sum of proper divisors of n
 * If d(a) = b and d(b) = a and a != b, a and b are called amicable numbers
 * Evaluate the sum of all the amicable numbers under 10000.
 * Answer:    31626
*/

#include <iostream>
using namespace std;

int d(int n)
{
	int sum = 1;
	for (int i = 2; i <= n/2; i++)
		if (n % i == 0)
			sum += i;
	return sum;
}

int main()
{
	int sum = 0;
	for (int a = 1; a < 10000; a++)
	{
		int b = d(a);
		if (d(b) == a && a != b)
			sum += a;
	}
	cout << sum << endl;

	return 0;
}

