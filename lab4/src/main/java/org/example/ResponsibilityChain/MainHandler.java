package org.example.ResponsibilityChain;

public class MainHandler implements Handler {

	private Handler nextHandler;

	@Override
	public void handle(Request request) {
		if (nextHandler != null) {
			nextHandler.handle(request);
		} else {
			System.out.println("No one handler can't handle request");
		}
	}

	public void setNextHandler(Handler nextHandler) {
		this.nextHandler = nextHandler;
	}

}
