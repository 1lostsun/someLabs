package org.example.ResponsibilityChain;

public interface Handler {

	void handle(Request request);
	void setNextHandler(Handler nextHandler);

}
