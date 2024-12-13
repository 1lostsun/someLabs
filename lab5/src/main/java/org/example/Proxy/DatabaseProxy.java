package org.example.Proxy;

public class DatabaseProxy implements Database {

	private RealDatabase realDatabase;
	private Boolean hadAccess;

	public DatabaseProxy(RealDatabase realDatabase, Boolean hadAccess) {
		this.realDatabase = realDatabase;
		this.hadAccess = hadAccess;
	}

	@Override
	public void query(String query) {
		if (hadAccess) {
			realDatabase.query(query);
		} else {
			System.out.println("Access denied");
		}
	}

}
