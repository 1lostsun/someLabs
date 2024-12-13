package org.example.Bridge;

public class BasicRemoteControl extends RemoteControl {

	public BasicRemoteControl(Device device) {
		super(device);
	}

	@Override
	public void powerOn() {
		device.turnOn();
	}

	@Override
	public void powerOff() {
		device.turnOff();
	}

	@Override
	public void setChannel(int channel) {
		device.setChannel(channel);
	}

}
