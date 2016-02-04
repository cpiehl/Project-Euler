/* Project Euler #42
 * The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1);
 *   so the first ten triangle numbers are:
 *   1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 * By converting each letter in a word to a number corresponding to its
 *   alphabetical position and adding these values we form a word value.
 * For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
 * If the word value is a triangle number then we shall call the word a
 *   triangle word.
 * Using p042_words.txt, a 16K text file containing nearly two-thousand
 *   common English words, how many are triangle words?
 * Answer:    162
*/

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int word_value(string s)
{
	int sum = 0;
	for (unsigned int i = 0; i < s.size(); i++)
		sum += (s[i] - 'A' + 1);
	return sum;
}

bool is_triangle_number(int n)
{
	int t = 1;
	for (int i = 1; t < n; i++)
		t = 0.5 * i * (i + 1);
	return t == n;
}

int main()
{
	int count = 0;
	string name;
	ifstream fin;
	fin.open("p042_words.txt");
	if (fin.is_open())
	{
		while (!fin.eof())
		{
			getline(fin, name, ',');
			name = name.substr(1,name.length()-2);
			int value = word_value(name);
			if (is_triangle_number(value))
				count++;
		}
	}
	fin.close();

	cout << count << endl;

	return 0;
}
