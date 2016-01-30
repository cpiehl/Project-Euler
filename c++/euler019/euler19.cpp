/* Project Euler #19
 * How many Sundays fell on the first of the month during the
 *   twentieth century (Jan 1, 1901 to Dec 31, 2000)?
 * Jan 1, 1900 was a Monday
 * Answer:    1074
*/

#include <iostream>
using namespace std;

int daysInMonth(int month, int year)
{
	int days = 0;
	switch(month)
	{
		case 2:
			days = 28;
			if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
				days++;
			break;
		case 9: // 30-day months
		case 4:
		case 6:
		case 11:
			days = 30;
			break;
		default: // 31-day months
			days = 31;
	}
	return days;
}

int main()
{
	int sundayCount = 0;
	int dayOfWeek = 1; // 1=Monday, 7=Sunday
	int day = 1;
	int month = 1;
	int year = 1900;

	while (year <= 2000)
	{
		month = 1;
		while (month <= 12)
		{
			day = 1;
			int days = daysInMonth(month, year);
			while (day <= days)
			{
				dayOfWeek++;
				if (dayOfWeek == 7) // If it's a Sunday
				{
					if (day == 1 && year >= 1901) // First of the month
						sundayCount++;
					dayOfWeek = 0;
				}
				day++;
			}
			month++;
		}
		year++;
	}

	cout << sundayCount << endl;

	return 0;
}

