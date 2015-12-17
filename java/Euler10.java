/* Project Euler #10
 * Find the sum of all the primes below two million.
 * Answer:  142913828922
*/

public class Euler10 {
	private static final int MAX = 2000000;
	public static void main(String[] args) {
		boolean[] marked = new boolean[MAX];
		int value = 3;
		long s = 2;
		for (int i = 0; i < MAX ; i++) marked[i] = false;
		while (value < MAX)
		{
			if (!marked[value])
			{
				s += value;
				int i = value;
				while (i < MAX)
				{
					marked[i] = true;
					i += value;
				}
			}
			value += 2;
		}
		System.out.println(s);
	}
}