/* Project Euler #40
 * An irrational decimal fraction is created by concatenating the positive integers:
 *   0.123456789101112131415161718192021...
 * It can be seen that the 12th digit of the fractional part is 1.
 * If dn represents the nth digit of the fractional part,
 *   find the value of the following expression.
 * Answer:    210
*/

#include <iostream>
#include <string>
using namespace std;

static int pow10[10] = {
	1, 10, 100, 1000, 10000,
	100000, 1000000, 10000000
};

string itostr(int n, int base)
{
	string s;
	if (n == 0) return "0";
	while (n > 0)
	{
		int digit = n % base;
		s = (char)(digit > 9 ? digit + 'A' - 10 : digit + '0') + s;
		n /= base;
	}
	return s;
}

string itostr(int n)
{
	return itostr(n, 10);
}

int main()
{
	const int MAX = 1000000;
	string n = "";
	for (int i = 0; n.size() < MAX; i++)
		n += itostr(i);

	int result = 1;
	for (int i = 0; pow10[i] < MAX; i++)
		result *= (n[pow10[i]] - '0');

	cout << result << endl;

	return 0;
}
