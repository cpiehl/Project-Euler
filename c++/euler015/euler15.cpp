/* Project Euler #15
 * Starting in the top left corner of a 2x2 grid, and only being able to
 *   move to the right and down, there are exactly 6 rotues to the bottom
 *   right corner.
 * How many such routes are there through a 20x20 grid?
 * Answer:    137846528820
 *
 * Note: 40!/(20!)(20!) is boring!
 * Manually math out Pascal's triangle instead
*/

#include <iostream>
using namespace std;

int main()
{
	const int SIZE = 20;
	const int MAX = 2 * SIZE + 1;
	unsigned long long int matrix[MAX][MAX] = {0LL};
	for (int n = 0; n < MAX; n++)
	{
		matrix[n][0] = 1LL;
		matrix[0][n] = 1LL;
	}

	for (int y = 1; y < MAX; y++)
		for (int x = 1; x < MAX; x++)
			matrix[x][y] = matrix[x-1][y] + matrix[x][y-1];

	cout << matrix[SIZE][SIZE] << endl;
	return 0;
}

