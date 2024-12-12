package org.example.FactoryMethod.Creators;

import org.example.FactoryMethod.Products.Product;
import org.example.FactoryMethod.Products.SomeProductTwo;

public class SomeCreatorTwo extends Creator {

	@Override
	public Product createProduct() {
		return new SomeProductTwo();
	}

}
