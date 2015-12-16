/* Project Euler #7
 * What is the 10001st prime number?
 * Answer: 104743
*/

#include <iostream>
#include <cmath>

int main()
{
	int i = 3;
	int n = 1;
	int s = 1;
	int x;
	while (i <= 10001)
	{
		if (s == 1)
		{
			x = 6 * n - 1;
			s = 0;
		} else {
			x = 6 * n + 1;
			s = 1;
			n = n + 1;
		}
		float r = std::pow(x, 0.5);
		int p = 1;
		int t = 3;
		while (t <= r)
		{
			if (x % t == 0)
				p = 0;
			t += 2;
		}
		if (p == 1)
			i++;
	}

	std::cout << x << std::endl;
	return 0;
}

