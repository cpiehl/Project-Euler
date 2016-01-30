#include <iostream>

int main()
{
	int sum = 0;
	int n = 1;
	int lastn = 0;
	while (n + lastn < 100)
	{
		int newn = n + lastn;
		if (newn % 2 == 0)
			sum += newn;
		lastn = n;
		n = newn;
	}
	std::cout << sum << std::endl;
	return 0;
}
