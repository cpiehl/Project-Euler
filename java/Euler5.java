/* Project Euler #5
 * 2520 is the smallest number that can be divided by each of the numbers
 *   from 1 to 10 without any remainder.
 * What is the smallest positive number that is evenly divisible by all
 *   of the numbers from 1 to 20?
 * Answer: 232792560
*/

public class Euler5 {
	public static void main(String[] args) {
		long result = 0L;
		boolean found = false;
		while (!found)
		{
			result += 2520;
			found = true;
			for (int i = 11; i <= 20; i++)
			{
				if (result % i != 0)
				{
					found = false;
					break;
				}
			}
		}
		System.out.println(result);
	}
}