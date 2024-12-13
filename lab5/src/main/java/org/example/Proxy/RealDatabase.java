package org.example.Proxy;

public class RealDatabase implements Database {

	@Override
	public void query(String query) {
		System.out.println("query: " + query);
	}

}
