/* Project Euler #3
 * What is the largest prime factor of the number 600851475143 ?
 * Answer:		6857
 */

#include <iostream>
using namespace std;

int main()
{
	long long int number = 600851475143;
	int divisor = 2;
	while (number > 1) {
		if (0 == (number % divisor)) {
			number /= divisor;
			divisor--;
		}
		divisor++;
	}
	cout << divisor << endl;
	return 0;
}
