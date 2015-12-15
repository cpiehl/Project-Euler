#include <iostream>

int main()
{
	long result = 0;
	bool found = false;
	while (!found)
	{
		result += 1260;
		found = true;
		for (int i = 3; i <= 19; i++)
		{
			if (result % i != 0)
			{
				found = false;
				break;
			}
		}
	}
	std::cout << result << std::endl;
	return 0;
}

