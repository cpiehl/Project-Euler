/* Project Euler #13
 * Output the first 10 digits of the sum of the 100 50-digit numbers
 *   in input13.txt
 * Answer:   	5537376230
*/

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
using namespace std;

template <typename T>
std::string to_string(T const& value) {
    stringstream sstr;
    sstr << fixed << value;
    return sstr.str();
}

int main()
{
	double sum = 0.0f; // ~15 digit precision, enough for the 10+2 required
	double temp;
	ifstream fin;
	fin.open("input13.txt");
	if (fin.is_open())
	{
		while (!fin.eof())
		{
			fin >> temp;
			sum += temp;
		}
	}
	cout << to_string(sum).substr(0,10) << endl;
	return 0;
}

