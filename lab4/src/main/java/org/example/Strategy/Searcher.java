package org.example.Strategy;

public class Searcher {

	private SearchingStrategy searchingStrategy;

	public void setSearchingStrategy(SearchingStrategy searchingStrategy) {
		this.searchingStrategy = searchingStrategy;
	}

	public int search(int[] arr, int x) {
		return searchingStrategy.search(arr, x);
	}

}
