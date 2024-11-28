package org.example.buildings;

import org.example.Interfaces.Attacker;
import org.example.units.Unit;

public class Fort implements Attacker {

	private int damage;

	public Fort(int damage) {
		this.damage = damage;
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
