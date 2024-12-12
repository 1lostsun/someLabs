package org.example.AbstractFactory.Asus;

import org.example.AbstractFactory.Interfaces.Phone;

public class AsusPhone implements Phone {

	@Override
	public void ringing() {

		System.out.println("Asus phone is ringing");

	}
}
