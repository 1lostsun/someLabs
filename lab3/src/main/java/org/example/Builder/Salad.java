package org.example.Builder;

public class Salad {

	private String tomatoes;
	private String cucumbers;
	private String peppers;
	private String oil;

	public void setTomatoes(String tomatoes) {
		this.tomatoes = tomatoes;
	}

	public void setCucumbers(String cucumbers) {
		this.cucumbers = cucumbers;
	}

	public void setPeppers(String peppers) {
		this.peppers = peppers;
	}

	public void setOil(String oil) {
		this.oil = oil;
	}

	public String makeSalad() {

		return "Salad{" +
				"tomatoes = '" + tomatoes + '\'' +
				", cucumbers = '" + cucumbers + '\'' +
				", peppers = '" + peppers + '\'' +
				", oil = '" + oil + '\'' +
				'}';

	}
}
