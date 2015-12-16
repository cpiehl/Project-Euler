/* Project Euler #7
 * What is the 10001st prime number?
 * Answer: 104743
*/

import java.lang.*;

public class Euler7 {
	public static void main(String[] args) {
		int i = 3;
		int n = 1;
		int s = 1;
		int x = 0;
		while (i <= 10001)
		{
			if (s == 1)
			{
				x = 6 * n - 1;
				s = 0;
			} else {
				x = 6 * n + 1;
				s = 1;
				n = n + 1;
			}
			double r = Math.pow(x, 0.5);
			int p = 1;
			int t = 3;
			while (t <= r)
			{
				if (x % t == 0)
					p = 0;
				t += 2;
			}
			if (p == 1)
				i++;
		}
		System.out.println(x);
	}
}