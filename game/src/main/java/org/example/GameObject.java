package org.example;

public class GameObject {

	private int id;
	private String name;
	private int xCoord;
	private int yCoord;

	public GameObject(int id, String name, int x, int y) {
		this.id = id;
		this.name = name;
		this.xCoord = x;
		this.yCoord = y;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getyCoord() {
		return yCoord;
	}

	public int getXCoord() {
		return xCoord;
	}

}
