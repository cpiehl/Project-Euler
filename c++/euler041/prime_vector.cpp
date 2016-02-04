#include <algorithm>
#include <iostream>
#include <iterator>
#include <vector>

int main()
{
    std::vector<unsigned long long> numbers;
    unsigned long long maximum = 4294967296;
    for (unsigned long long i = 2; i <= maximum; ++i)
    {
        if (numbers.empty())
        {
            numbers.push_back(i);
            continue;
        }

        if (std::none_of(numbers.begin(), numbers.end(), [&](unsigned long long p)
        {
            return i % p == 0;
        }))
        {
            numbers.push_back(i);
        }

    }

    std::cout << "Primes:  " << std::endl;
    std::copy(numbers.begin(), numbers.end(), std::ostream_iterator<int>(std::cout, " "));

    return 0;
}