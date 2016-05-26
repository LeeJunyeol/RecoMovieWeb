package com.sort;

public class similarity {
	private int movieid=0;
	private double rate=0;
	
	public similarity(int movieid, double rate) {
		super();
		this.movieid = movieid;
		this.rate = rate;
	}

	public int getMovieid() {
		return movieid;
	}

	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return movieid + "," + rate;
	}
	
	
	
	
}
