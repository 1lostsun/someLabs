package org.example.Builder;

public class SuperSalad implements SaladBuilder {

	private Salad salad;

	@Override
	public void chooseTomatoes() {
		salad.setTomatoes("cherry tomatoes");
	}

	@Override
	public void chooseCucumbers() {
		salad.setCucumbers("short cucumbers");
	}

	@Override
	public void choosePeppers() {
		salad.setPeppers("bulgarian peppers");
	}

	@Override
	public void chooseOil() {
		salad.setOil("olive oil");
	}

	public Salad getResult() {
		return salad;
	}

}
