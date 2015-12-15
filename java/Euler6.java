/* Project Euler #6
 * Find the difference between the sum of the squares of the first one
 *   hundred natural numbers and the square of the sum.
 * Answer: 25164150
*/

public class Euler6 {
	public static void main(String[] args) {
		long squareofsums = 0L;
		long sumofsquares = 0L;
		for (int i = 1; i < 101; i++)
		{
			squareofsums += i;
			sumofsquares += i*i;
		}
		squareofsums *= squareofsums;
		System.out.println(squareofsums - sumofsquares);
	}
}