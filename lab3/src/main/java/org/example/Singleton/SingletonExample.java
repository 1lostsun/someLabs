package org.example.Singleton;

public class SingletonExample {

	private static SingletonExample instance;

	private SingletonExample() {}

	public static SingletonExample getInstance() {
		if (instance == null) {
			instance = new SingletonExample();
		}

		return instance;
	}

	public void someMethod() {
		System.out.println("Some method");
	}

}
