package org.example.units;

import org.example.GameObject;

public class Unit extends GameObject {

	private boolean isAlive;
	private float HP;

	public Unit(int id, String name, int x, int y, boolean isAlive, float HP) {
		super(id, name, x, y);
		this.isAlive = isAlive;
		this.HP = HP;
	}

	void receiveDamage(float damage) {
		HP -= damage;
	}

	public float getHP() {
		return HP;
	}

	public void setHP(float HP) {
		this.HP = HP;
	}

	public boolean isAlive() {
		return isAlive;
	}

	public void setAlive(boolean alive) {
		isAlive = alive;
	}

}
