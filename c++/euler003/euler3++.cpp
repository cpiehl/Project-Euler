/* Project Euler #3
 * What is the largest prime factor of the number 600851475143 ?
 * Answer:		6857
 */

#include <iostream>
using namespace std;

int main()
{
	long long int number = 600851475143LL;
	while (0 == (number % 2) && number > 1)
	{
		number /= 2;
	}
	int divisor = 3;
	while (number > 1)
	{
		if (0 == (number % divisor))
			number /= divisor;
		else
			divisor += 2;
	}
	cout << divisor << endl;
	return 0;
}
