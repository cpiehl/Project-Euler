/* Project Euler #22
 * Using names.txt, a 46K text file containing over five-thousand first names,
 *   begin by sorting it into alphabetical order. Then working out the
 *   alphabetical value for each name, multiply this value by its
 *   alphabetical position in the list to obtain a name score.
 *
 * For example, when the list is sorted into alphabetical order, COLIN,
 *   which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
 *   So, COLIN would obtain a score of 938 × 53 = 49714.
 *
 * What is the total of all the name scores in the file?
 *
 * Answer:    871198282
*/

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

int main()
{
	vector<string> names;
	string name;

	ifstream fin;
	fin.open("p022_names.txt");
	if (fin.is_open())
	{
		while (!fin.eof())
		{
			getline(fin, name, ',');
			names.push_back(name.substr(1,name.length()-2));
		}
	}
	fin.close();

	sort(names.begin(), names.end());

	long long int sum = 0LL;
	for (unsigned int i = 0; i < names.size(); i++)
	{
		int score = 0;
		for (unsigned int j = 0; j < names[i].length(); j++)
			score += (names[i][j] - 'A' + 1);
		score *= (i + 1);
		sum += score;
	}
	cout << sum << endl;

	return 0;
}

