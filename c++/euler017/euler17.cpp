/* Project Euler #17
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written
 *   out in words, how many letters would be used?
 * Answer:    21124
*/

#include <iostream>
#include <string>
using namespace std;

string numToWords(int n)
{
	string result = "";
	if (n == 1) result = "one";
	else if (n == 2) result = "two";
	else if (n == 3) result = "three";
	else if (n == 4) result = "four";
	else if (n == 5) result = "five";
	else if (n == 6) result = "six";
	else if (n == 7) result = "seven";
	else if (n == 8) result = "eight";
	else if (n == 9) result = "nine";
	else if (n == 10) result = "ten";
	else if (n == 11) result = "eleven";
	else if (n == 12) result = "twelve";
	else if (n == 13) result = "thirteen";
	else if (n == 14) result = "fourteen";
	else if (n == 15) result = "fifteen";
	else if (n == 16) result = "sixteen";
	else if (n == 17) result = "seventeen";
	else if (n == 18) result = "eighteen";
	else if (n == 19) result = "nineteen";
	else if (n == 20) result = "twenty";
	else if (n == 30) result = "thirty";
	else if (n == 40) result = "forty";
	else if (n == 50) result = "fifty";
	else if (n == 60) result = "sixty";
	else if (n == 70) result = "seventy";
	else if (n == 80) result = "eighty";
	else if (n == 90) result = "ninety";
	else if (n == 100) result = "hundred";
	else if (n == 1000) result = "thousand";

	return result;
}

int main()
{
	int sum = 0;
	for (int i = 1; i <= 1000; i++)
	{
		string result;
		int n = i;
		// Do thousands
		if (n >= 1000)
		{
			result += numToWords(n/1000);
			result += numToWords(1000);
			n = n % 1000;
		}
		// Do hundreds
		if (n >= 100)
		{
			result += numToWords(n/100);
			result += numToWords(100);
			n = n % 100;
		}
		// Add "and" if needed
		if (n > 0 && i >= 100)
			result += "and";
		// Deal with one through nineteen
		if (n < 20)
		{
			result += numToWords(n);
		}
		// Twenty through ninety-nine
		else
		{
			result += numToWords((n/10)*10);
			n = n % 10;
			result += numToWords(n);
		}
		sum += result.length();
	}

	cout << sum << endl;

	return 0;
}

