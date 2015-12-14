public class Euler4 {
	public static void main(String[] args) {
		int result = -1;
		for (int x = 100; x < 1000; x++) {
			for (int y = 100; y < 1000; y++) {
				int num = x * y;
				String numstr = String.valueOf(num);
				if (numstr.equals(new StringBuilder(numstr).reverse().toString()) && num > result) {
					result = num;
					break;
				}
			}
		}
		System.out.println(result);
	}
}