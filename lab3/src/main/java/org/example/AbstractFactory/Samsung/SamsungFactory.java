package org.example.AbstractFactory.Samsung;

import org.example.AbstractFactory.Interfaces.AbstractFactory;
import org.example.AbstractFactory.Interfaces.Laptop;
import org.example.AbstractFactory.Interfaces.Phone;

public class SamsungFactory implements AbstractFactory {

	@Override
	public Laptop createLaptop() {

		return new SamsungLaptop();

	}

	@Override
	public Phone createPhone() {

		return new SamsungPhone();

	}

}
