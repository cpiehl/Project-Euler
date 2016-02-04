/* Project Euler #41
 * We shall say that an n-digit number is pandigital if it makes use of all
 *   the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital
 *   and is also prime.
 * What is the largest n-digit pandigital prime that exists?
 * Answer:    7652413
*/

#include <iostream>
using namespace std;

static unsigned int pow10[10] = {
	1, 10, 100, 1000, 10000, 100000, 1000000,
	10000000, 100000000, 1000000000
};

bool is_prime(unsigned int n)
{
	for (unsigned long int i = 3L; i * i < n; i += 2) // guaranteed odd input
		if (n % i == 0)
			return false;
	return true;
}

bool is_pandigital(unsigned int n)
{
	bool used_digits[10] = {false};
	unsigned int length = 9;
	for ( ; length > 0 && pow10[length-1] > n; length--) {}
	for (unsigned int i = 0; i < length; i++)
	{
		used_digits[n % 10] = true;
		n /= 10;
	}
	if (used_digits[0])
		return false;
	else
		for (unsigned int i = 1; i <= length; i++)
			if (!used_digits[i])
				return false;
	return true;
}

int main()
{
	int pandigital = 987654321;

	while (pandigital > 1)
	{
		if (is_pandigital(pandigital))
		{
			if (is_prime(pandigital))
				break;
		}
		pandigital -= 2;
	}
	cout << pandigital << endl;

	return 0;
}
