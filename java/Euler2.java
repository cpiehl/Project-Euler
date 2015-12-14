public class Euler2 {
	public static void main(String[] args) {
		int sum = 0;
		int n = 1;
		int lastn = 0;
		while (n < 4000000) {
			int newn = n + lastn;
			if (newn % 2 == 0)
				sum += newn;
			lastn = n;
			n = newn;
		}
		System.out.println(sum);
	}
}