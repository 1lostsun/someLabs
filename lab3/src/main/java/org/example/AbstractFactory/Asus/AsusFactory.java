package org.example.AbstractFactory.Asus;

import org.example.AbstractFactory.Interfaces.AbstractFactory;
import org.example.AbstractFactory.Interfaces.Laptop;
import org.example.AbstractFactory.Interfaces.Phone;

public class AsusFactory implements AbstractFactory {

	@Override
	public Laptop createLaptop() {

		return new AsusLaptop();

	}

	@Override
	public Phone createPhone() {

		return new AsusPhone();

	}

}
