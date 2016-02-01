/* Project Euler #24
 * What is the millionth lexicographic permutation of the digits
 *   0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
 * Answer:    2783915460
*/

#include <iostream>
using namespace std;

void swap(int* s, int a, int b)
{
	s[a] ^= s[b];
	s[b] ^= s[a];
	s[a] ^= s[b];
}

// SEPA algorithm
int permute(int* a, int len)
{
	int key = len - 1;
	int newkey = len - 1;
	while ((key > 0) && (a[key] <= a[key - 1])) key--;
	key--;
	if (key < 0) return 0;
	newkey = len - 1;
	while ((newkey > key) && (a[newkey] <= a[key]))
	{
		newkey--;
	}
	swap(a, key, newkey);
	len--;
	key++;
	while (len > key)
	{
		swap(a, len, key);
		key++;
		len--;
	}
	return 1;
}

int main()
{
	int a[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
	int size = sizeof(a) / sizeof(a[0]);
	int count = 1; // 0123456789 is permutation #1

	while (count < 1000000)
	{
		if (permute(a, size)) // true if next lexicographic
			count++;
		else break;
	}

	for (int i = 0; i < size; i++)
		cout << a[i];
	cout << endl;

	return 0;
}

