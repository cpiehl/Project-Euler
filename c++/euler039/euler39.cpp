/* Project Euler #39
 * If p is the perimeter of a right angle triangle with integral length sides,
 *   {a,b,c}, there are exactly three solutions for p = 120.
 *   {20,48,52}, {24,45,51}, {30,40,50}
 * For which value of p ≤ 1000, is the number of solutions maximized?
 * Answer:    840
*/

#include <iostream>
using namespace std;

int main()
{
	const int p = 1000;
	int count = 0, maxcount = 0, max_p = 0;
	for (int i = 12; i <= p; i++) // Start with {3,4,5} p=12
	{
		count = 0;
		// a+b > c, add c to both sides, a+b+c > 2c
		// a+b+c <= 1000, so 2c <= 1000, c <= 500
		// c is the longest side, so a < 500
		for (int a = 1; a < 500; a++)
		{
			for (int b = 1; a + b < i; b++)
			{
				int c = i - a - b;
				if (a * a + b * b == c * c)
					count++;
			}
		}
		if (count > maxcount)
		{
			max_p = i;
			maxcount = count;
		}
	}

	cout << max_p << endl;

	return 0;
}

