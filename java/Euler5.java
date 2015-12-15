public class Euler5 {
	public static void main(String[] args) {
		long result = 0L;
		boolean found = false;
		while (!found)
		{
			result += 2520;
			found = true;
			for (int i = 11; i <= 19; i++)
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