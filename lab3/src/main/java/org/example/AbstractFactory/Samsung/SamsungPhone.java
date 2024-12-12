package org.example.AbstractFactory.Samsung;

import org.example.AbstractFactory.Interfaces.Phone;

public class SamsungPhone implements Phone {

	@Override
	public void ringing() {

		System.out.println("Samsung Phone is Ringing");

	}

}
