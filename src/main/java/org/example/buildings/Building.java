package org.example.buildings;

import org.example.GameObject;

public class Building extends GameObject {

	boolean isBuilt;

	public Building(int id, String name, int x, int y) {
		super(id, name, x, y);
	}

	public boolean isBuilt() {
		return isBuilt;
	}
}
