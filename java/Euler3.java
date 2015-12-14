public class Euler3 {
	public static void main(String[] args) {
		long number = 600851475143L;
		int divisor = 2;
		while (number > 1) {
			if (number % divisor == 0) {
				number /= divisor;
				divisor--;
			}
			divisor++;
		}
		System.out.println(divisor);
	}
}