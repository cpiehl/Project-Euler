#include <iostream>

int main()
{
	long long int number = 600851475143;
	int divisor = 2;
	while (number > 1) {
		if (0 == (number % divisor)) {
			number /= divisor;
			divisor--;
		}
		divisor++;
	}
	std::cout << divisor << std::endl;
	return 0;
}

