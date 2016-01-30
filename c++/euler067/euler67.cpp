/* Project Euler #67
 * Find the maximum total from top to bottom of the triangle in the file
 * Answer:    7273
*/

#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	const int SIZE = 101;
	int triangle[SIZE][SIZE] = {0};

	ifstream fin;
	fin.open("p067_triangle.txt");
	if (fin.is_open())
	{
		for (int i = 0; i < SIZE; i++)
			for (int j = 0; j < i; j++)
				if (!fin.eof())
					fin >> triangle[i][j];
	}
	fin.close();

	for (int i = SIZE - 2; i >= 0; i--)
	{
		for (int j = 0; j <= i; j++)
		{
			if (triangle[i+1][j] > triangle[i+1][j+1])
				triangle[i][j] += triangle[i+1][j];
			else
				triangle[i][j] += triangle[i+1][j+1];
		}
	}

	cout << triangle[0][0] << endl;

	return 0;
}

