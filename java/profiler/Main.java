import java.util.stream.*;

public class Main {

	public static void main(String[] args) {
		
		IntStream.range(1, 1000000)
			//.parallel()
			.filter(Main::evenNumber)
			.map(Main::plus100)
			.forEach(Main::process);
	}

	static boolean evenNumber(int i){
		return i%2==0;
	}

	static int plus100(int i){
		return i+100;
	}

	static void process(int value ){
		try {
			Thread.sleep(500);
			System.out.printf("processing value %d%n",value);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}