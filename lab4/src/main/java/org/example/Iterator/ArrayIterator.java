package org.example.Iterator;

import java.util.logging.Logger;

public class ArrayIterator implements Iterator<Object> {

	private static final Logger logger = Logger.getLogger(String.valueOf(ArrayIterator.class));
	private Object[] array;
	private int index;

	public ArrayIterator(Object[] array) {
		this.array = array;
		this.index = 0;
	}

	public boolean hasNext() {
		return index < array.length;
	}

	public Object next() {
		try {
			return array[index++];
		} catch (Exception e) {
			logger.warning(e.getMessage());
			return null;
		}

	}

}
