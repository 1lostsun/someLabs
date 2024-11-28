package org.example.units;

import org.example.Interfaces.Attacker;
import org.example.Interfaces.Moveable;

public class Archer extends Unit implements Attacker, Moveable {

	private int damage;

	public Archer(int id, String name, int x, int y, boolean isAlive, float HP) {
		super(id, name, x, y, isAlive, HP);
	}

	public void attack(Unit unit) {
		unit.setHP(unit.getHP() - getDamage());
	}

	public int getDamage() {
		return damage;
	}

	public void setDamage(int damage) {
		this.damage = damage;
	}
}
