package org.example.ResponsibilityChain;

public class EmailHandler implements Handler {

	private Handler nextHandler;

	@Override
	public void handle(Request request) {
		if (request.getType().equals(RequestType.EMAIL)) {
			System.out.println("EmailHandler handle request");
		} else if (nextHandler != null) {

			nextHandler.handle(request);

		}
	}

	@Override
	public void setNextHandler(Handler nextHandler) {
		this.nextHandler = nextHandler;
	}
}
