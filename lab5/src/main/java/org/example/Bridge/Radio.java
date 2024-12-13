package org.example.Bridge;

public class Radio implements Device {

	private boolean isOn = false;
	private int frequency = 100;

	@Override
	public void turnOn() {
		isOn = true;
		System.out.println("Radio is turned ON");
	}

	@Override
	public void turnOff() {
		isOn = false;
		System.out.println("Radio is turned OFF");
	}

	@Override
	public void setChannel(int frequency) {
		if (isOn) {
			this.frequency = frequency;
			System.out.println("Radio frequency set to " + frequency);
		} else {
			System.out.println("Radio is OFF. Cannot set frequency.");
		}
	}

}
