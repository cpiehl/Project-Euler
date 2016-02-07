/* Project Euler #38
 * Take the number 192 and multiply it by each of 1, 2, and 3:
 *   192 × 1 = 192
 *   192 × 2 = 384
 *   192 × 3 = 576
 * By concatenating each product we get the 1 to 9 pandigital, 192384576.
 * The same can be achieved by starting with 9 and multiplying by
 *   1, 2, 3, 4, and 5, giving the pandigital, 918273645.
 * What is the largest 1 to 9 pandigital 9-digit number that can be formed as
 *   the concatenated product of an integer with (1,2, ... , n) where n > 1?
 * Answer:    932718654
*/

#include <iostream>
#include <string>
using namespace std;

string itostr(int n, int base)
{
	string s;
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

bool is_pandigital(string n)
{
	if (n.size() != 9)
		return false;
	bool used_digits[10] = {false};
	for (unsigned int i = 0; i < n.size(); i++)
		used_digits[n[i] - '0'] = true;
	if (used_digits[0])
		return false;
	else
		for (unsigned int i = 1; i <= n.size(); i++)
			if (!used_digits[i])
				return false;
	return true;
}

int main()
{
	// (9 * 1) + (9 * 2) + (9 * 3) + (9 * 4) + (9 * 5) = 918273645
	//   Number must start with 9 to be bigger
	// n > 1, so 4 digits or less
	// 2 digits and n=3 => 8 digits, n=4 => 11 digits
	//   (91 * 1) + (91 * 2) + (91 * 3) = 91182273
	//   (91 * 1) + (91 * 2) + (91 * 3) + (91 * 4) = 91182273364
	// 3 digits and n=2 => 7 digits, n=3 => 11 digits
	//   (912 * 1) + (912 * 2) = 9121824
	//   (912 * 1) + (912 * 2) + (987 * 3) = 91218242736
	// 4 digits and n=2 => 9 digits, n=3 => 14 digits
	//   (9123 * 1) + (9123 * 2) = 912318246
	//   (9123 * 1) + (9123 * 2) + (9123 * 3) = 91231824627369
	// 5 digits and n=2 => >10 digits
	//   (12345 * 1) + (12345 * 2) = 1234524690
	// Number must be 4 digits, >9000, n=2

	// If second digit is >4, 2*95...=19..., which contains a second 9
	// Number must be <9500
	string concat_product;
	for (int i = 9487; i >= 9123; i--)
	{
		concat_product = itostr(i) + itostr(2 * i);
		if (is_pandigital(concat_product))
			break;
	}

	cout << concat_product << endl;

	return 0;
}

