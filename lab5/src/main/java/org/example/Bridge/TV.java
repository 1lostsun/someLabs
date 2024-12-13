package org.example.Bridge;

public class TV implements Device {

	private boolean isOn = false;
	private int channel = 1;

	@Override
	public void turnOn() {
		isOn = true;
		System.out.println("TV is turned ON");
	}

	@Override
	public void turnOff() {
		isOn = false;
		System.out.println("TV is turned OFF");
	}

	@Override
	public void setChannel(int channel) {
		if (isOn) {
			this.channel = channel;
			System.out.println("TV channel set to " + channel);
		} else {
			System.out.println("TV is OFF. Cannot set channel.");
		}
	}

}
