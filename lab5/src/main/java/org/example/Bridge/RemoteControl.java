package org.example.Bridge;

public abstract class RemoteControl {

	protected Device device;

	public RemoteControl(Device device) {
		this.device = device;
	}

	public abstract void powerOn();
	public abstract void powerOff();
	public abstract void setChannel(int channel);

}
