package org.example.FactoryMethod.Creators;

import org.example.FactoryMethod.Products.Product;
import org.example.FactoryMethod.Products.SomeProductOne;

public class SomeCreatorOne extends Creator {

	@Override
	public Product createProduct() {
		return new SomeProductOne();
	}

}
