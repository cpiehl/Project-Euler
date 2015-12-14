#include <iostream>

int main()
{
	int result = -1;
	for (int x = 100; x < 1000; x++) {
		for (int y = 100; y < 1000; y++) {
			int num = x * y;
			int rev = 0;
			while (num != 0)
			{
				int remainder = num % 10;
				rev = rev * 10 + remainder;
				num /= 10;
			}
			num = x * y;
			if (num == rev && num > result) {
				result = num;
				break;
			}
		}
	}
	std::cout << result << std::endl;
	return 0;
}

