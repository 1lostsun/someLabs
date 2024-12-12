package org.example.ResponsibilityChain;


public class SmsHandler implements Handler {

	private Handler nextHandler;

	@Override
	public void handle(Request request) {
		if (request.getType().equals(RequestType.SMS)) {
			System.out.println("SmsHandler handle request");
		} else if (nextHandler != null) {
			nextHandler.handle(request);
		}
	}

	@Override
	public void setNextHandler(Handler nextHandler) {
		this.nextHandler = nextHandler;
	}

}
