package org.example.Builder;

public class Cook {

	private final SaladBuilder saladBuilder;

	public Cook(SaladBuilder saladBuilder) {
		this.saladBuilder = saladBuilder;
	}

	public void constructSalad() {
		saladBuilder.chooseOil();
		saladBuilder.chooseCucumbers();
		saladBuilder.choosePeppers();
		saladBuilder.chooseTomatoes();
	}

}
