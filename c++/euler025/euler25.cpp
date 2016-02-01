/* Project Euler #25
 * What is the index of the first term in the Fibonacci sequence to
 *   contain 1000 digits?
 * Answer:    4782
*/

#include <iostream>
#include <math.h>
using namespace std;

int main()
{

	double phi = 1.6180339887;
	// 1000*LOG Phi - (LOG 5)/2
	int x = 0;
	while (true)
	{
		double digits = x * log10(phi) - log10(5.0) / 2;
		if (digits > 999)
		{
			cout << digits << "=>" << x << endl;
			break;
		}
		x++;
	}

	return 0;
}

