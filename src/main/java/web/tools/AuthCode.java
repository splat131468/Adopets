package web.tools;

import java.util.Random;

public class AuthCode {
	int leftLimit = 48;
	int rightLimit = 122;
	int targetStringLength;

	public int getLeftLimit() {
		return leftLimit;
	}

	public void setLeftLimit(int leftLimit) {
		this.leftLimit = leftLimit;
	}

	public int getRightLimit() {
		return rightLimit;
	}

	public void setRightLimit(int rightLimit) {
		this.rightLimit = rightLimit;
	}

	public int getTargetStringLength() {
		return targetStringLength;
	}

	public void setTargetStringLength(int targetStringLength) {
		this.targetStringLength = targetStringLength;
	}

	public String givenUsingJava8_whenGeneratingRandomAlphanumericString_thenCorrect() {

		Random random = new Random();

		String generatedString = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		System.out.println(generatedString);
		return generatedString;
	}
}
