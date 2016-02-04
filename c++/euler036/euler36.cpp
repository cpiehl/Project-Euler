/* Project Euler #36
 * The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
 * Find the sum of all numbers, less than one million, which are palindromic
 *   in base 10 and base 2.
 * Answer:    872187
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

bool is_palindrome(string s)
{
	bool is_p = true;
	int size = s.size();
	for (int i = 0; i < size/2; i++)
	{
		if (s[i] != s[size-i-1])
		{
			is_p = false;
			break;
		}
	}
	return is_p;
}

int main()
{
	const int MAX = 1000000;
	int sum = 0;

	for (int i = 1; i < MAX; i++)
	{
		if (is_palindrome(itostr(i,10)) && is_palindrome(itostr(i,2)))
			sum += i;
	}

	cout << sum << endl;

	return 0;
}

