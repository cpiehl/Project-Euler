/* Project Euler #16
 * 2^15 = 32768 and the sum of its digits is 3+2+7+6+8 = 26
 * What is the sum of the digits of the number 2^1000?
 * Answer:    1366
*/

#include <iostream>
#include <string>
using namespace std;

string bigDouble(string s)
{
	int carry = 0;
	string result = "";
	// Start from LSD, work backwards
	for (int i = s.length()-1; i > -1; i--)
	{
		int resultdigit = (s[i] - '0') * 2 + carry;
		if (resultdigit >= 10)
		{
			resultdigit = resultdigit % 10;
			carry = 1;
		}
		else
			carry = 0;
		result = (char)(resultdigit + '0') + result;
	}
	if (carry)
		result = "1" + result;

	return result;
}

int main()
{
	string n = "1";
	for (int i = 0; i < 1000; i++)
		n = bigDouble(n);

	int sum = 0;
	for (unsigned int i = 0; i < n.length(); i++)
		sum += (n[i] - '0');

	cout << sum << endl;
	return 0;
}

